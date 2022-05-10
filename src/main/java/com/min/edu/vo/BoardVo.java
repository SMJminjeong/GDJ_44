package com.min.edu.vo;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@Getter
@Setter
@NoArgsConstructor
@ToString
public class BoardVo {

	private String seq;
	private String id;
	private String title;
	private String content;
	private String step;
	private String depth;
	private String refer;
	private String readcount;
	private String delflag;
	private String regdate;
}
