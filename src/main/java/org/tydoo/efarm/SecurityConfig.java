package org.tydoo.efarm;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.servlet.configuration.EnableWebMvcSecurity;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebMvcSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	public DataSource dataSource;

	
	@Override
    protected void configure(AuthenticationManagerBuilder authManagerBuilder) throws Exception {
		authManagerBuilder.jdbcAuthentication()
		.dataSource(dataSource)
		.usersByUsernameQuery(
				"select email as principal, password as credentials, true from person where email = ?")
		.authoritiesByUsernameQuery(
				"select email as principal, role as role from person where email = ?");
    }

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
        .authorizeRequests()
        	.antMatchers("/marketplace").authenticated()
            .antMatchers("/resources/**", "/**").permitAll() 
            .anyRequest().authenticated()
            .and()
        .formLogin()
            .loginPage("/login")
            .permitAll()
            .and()
        .logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout"));                                   
	}
	
}
