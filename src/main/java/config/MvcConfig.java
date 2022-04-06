package config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import env.AdminLogin;
import env.Login;

@Import(value = {MyBatisConfig.class})
@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "com.stone")
public class MvcConfig implements WebMvcConfigurer {

   @Override
   public void configureViewResolvers(ViewResolverRegistry registry) {
      registry.jsp("/WEB-INF/views/",".jsp");
   
   }
      
   @Override
   public void addResourceHandlers(final ResourceHandlerRegistry registry) {
      registry.addResourceHandler("/img/**","/style/**").addResourceLocations("/img/","/style/");
       registry.addResourceHandler("/upload/**").addResourceLocations("/upload/");
   }
      
   @Override
   public void addInterceptors(InterceptorRegistry registry) {
      registry.addInterceptor(new AdminLogin())
            .addPathPatterns("/adminnoticelist")   //로그인확인전체적용
            .addPathPatterns("/adminnoticedetail/**")   //로그인확인전체적용
            .addPathPatterns("/noticeadd")   //로그인확인전체적용
            .addPathPatterns("/noticeupdate/**")   //로그인확인전체적용
            .addPathPatterns("/noticeupdate")   //로그인확인전체적용
            .addPathPatterns("/noticedelete/**")   //로그인확인전체적용
            .addPathPatterns("/admin_reviewlist")   //로그인확인전체적용
            .addPathPatterns("/admin_main")   //로그인확인전체적용
            .addPathPatterns("/adminlogout")   //로그인확인전체적용
            .addPathPatterns("/memberList")   //로그인확인전체적용
            .addPathPatterns("/productadd")   //로그인확인전체적용
            .addPathPatterns("/admin_productlist/**")   //로그인확인전체적용
            .addPathPatterns("/admin_productdetail/**")   //로그인확인전체적용
            .addPathPatterns("/productupdate");   //로그인확인전체적용
         
      registry.addInterceptor(new Login())
              .addPathPatterns("/**")   //로그인확인전체적용
              .excludePathPatterns("/style/**")
              .excludePathPatterns("/img/**")
              .excludePathPatterns("//upload/**")
              .excludePathPatterns("/noticelist")
              .excludePathPatterns("/noticedetail/**")
              .excludePathPatterns("/reviewlist/**")
              .excludePathPatterns("/reviewdetail/**")
              .excludePathPatterns("/main")
              .excludePathPatterns("/store")
              .excludePathPatterns("/event")
              .excludePathPatterns("/washinfo")
              .excludePathPatterns("/login")
              .excludePathPatterns("/logout")
              .excludePathPatterns("/agree")
              .excludePathPatterns("/join")
              .excludePathPatterns("/cart")
              .excludePathPatterns("/adminlogin")
              .excludePathPatterns("/idcheck")
              .excludePathPatterns("/productlist/**")
              .excludePathPatterns("/productdetail/**");
   }
}