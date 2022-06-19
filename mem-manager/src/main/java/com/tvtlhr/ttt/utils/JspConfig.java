package com.tvtlhr.ttt.utils;

import org.apache.tomcat.util.descriptor.web.JspConfigDescriptorImpl;
import org.apache.tomcat.util.descriptor.web.JspPropertyGroup;
import org.apache.tomcat.util.descriptor.web.JspPropertyGroupDescriptorImpl;
import org.springframework.boot.web.embedded.tomcat.TomcatContextCustomizer;
import org.springframework.stereotype.Component;

import org.apache.catalina.*;
import javax.servlet.descriptor.JspPropertyGroupDescriptor;
import javax.servlet.descriptor.TaglibDescriptor;
import java.util.ArrayList;

@Component
public class JspConfig implements TomcatContextCustomizer  {
    @Override
    public void customize(Context context) {
        JspPropertyGroup pg = new JspPropertyGroup();
        pg.addUrlPattern("/*");
        pg.setPageEncoding("UTF-8");
        pg.setTrimWhitespace("true"); // optional, but nice to have
        ArrayList<JspPropertyGroupDescriptor> pgs = new ArrayList<>() ;
        pgs.add(new JspPropertyGroupDescriptorImpl(pg) );
        context.setJspConfigDescriptor(new JspConfigDescriptorImpl(pgs, new ArrayList<TaglibDescriptor>()));
    }

}
