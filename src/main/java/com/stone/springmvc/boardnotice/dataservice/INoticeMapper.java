package com.stone.springmvc.boardnotice.dataservice;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.stone.springmvc.boardnotice.common.Notice;

@Mapper
public interface INoticeMapper {
	
	//공지사항저장하다
	@Insert("insert into notice(title,contents,rdate,views,writer) values(#{title},#{contents},current_timestamp,#{views},#{writer.no})")
	public void save(Notice notice);
	
	//공지사항 목록출력하다
	@Select("select no,title,rdate,writer,views from notice")
	@Results(value= {
			@Result(property="no", column="no"),
			@Result(property="title", column="title"),
			@Result(property="rdate", column="rdate"),
			@Result(property="writer", column="writer", one=@One(select="com.stone.springmvc.member.dataservice.IAdminMapper.adminSerchByNo")),
			@Result(property="views", column="views")
			})
	public List<Notice> collectAll();
	
/*
	@Select("select no,title,writer,rdate,views from notice order by no desc limit #{startpageno},#{pagepernotice}")
	@Results(value= {
			@Result(property="no", column="no"),
			@Result(property="title", column="title"),
			@Result(property="contents", column="contents"),
			@Result(property="writer", column="writer",one=@One(select="com.stone.springmvc.member.dataservice.IMemberMapper.findByNo")),
			@Result(property="views", column="views")
	})
	public Object[] collectAll(int startpageno, int pagepernotice);
	*/
	
	//상세내역출력하다
	@Select("select no,title,contents,rdate,writer,views from notice where no=#{no}")
	@Results(value= {
			@Result(property="no", column="no"),
			@Result(property="title", column="title"),
			@Result(property="contents", column="contents"),
			@Result(property="rdate", column="rdate"),
			@Result(property="writer", column="writer", one=@One(select="com.stone.springmvc.member.dataservice.IAdminMapper.adminSerchByNo")),	
			@Result(property="views", column="views")
			})
	public Notice readAndView(int no);
	
	//조회수 증가하다
	@Update("update notice set views=views+1 where no=#{no}")
	public void viewCount(@Param("no") int no);
	
	//공지사항수정하다
	@Update("update notice set title=#{title}, contents=#{contents} where no=#{no}")
	public void update(Notice notice);
	
	//공지사항삭제하다
	@Delete("delete from notice where no=#{no}")
	public void delete(int no);
	
	
	  //총게시물수 구하기
//	  @Select("select count(*) from notice")
//	  public int NoticeCount();
	
}
