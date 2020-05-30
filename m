Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web12.1703.1590864001617717670
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 30 May 2020 11:40:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rI4DB87Y;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: jpewhacker@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id r15so7347058wmh.5
        for <meta-arm@lists.yoctoproject.org>; Sat, 30 May 2020 11:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jHDSEBR6QGNQYd8jnlV+LQfYyALdL74mDy+SpdWc9lU=;
        b=rI4DB87Yb47kSRL+HBxo2qi63XpmcDb8dFw01TAOI90RVM20By1CHlfr2YwOwKaB/q
         XBr1ej1/yWxE0M4cN+nqSDdnvEC/4qE+nom7MNWlgs8YDCeLHJ/6xS5Ef5gEBHFH9XAA
         3FUc/HdFizDZ7p0DloJQJlAv2tf57qfibs+BMoGm+Ac3H5ZmZ/Dn4bSoylyc4xN+hDuF
         N355dpQHoThniMKOQeuGyXYG8QA4AKwd6NH62/W0UZ76WJhHD1cAkOkF38ppkI7Q7X0G
         JMFR5AZaeeacbBSvy173sQUT2z3jiCvXm7Lx0GA2uOEpTdEJY+IXqrO/oE/4cmBZlY/z
         Msmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jHDSEBR6QGNQYd8jnlV+LQfYyALdL74mDy+SpdWc9lU=;
        b=TplGAX6MBqpdJe45WrRx06ePdp4WJtetG6FBXZfHkgrlQ/TZz154d/Xql2dNm0VOJl
         nFl4UqSJ9OT7yp+Whi1fZ9OxAgzz5ARJWrbUStMSQ/LtsjVB8HYNIXesMe+6RAv0d5QC
         oqJnciDyInRZGk0sD8seoNFO/d32Iclg3tgCZFpBKw8Oun60oU+SQPLZqNXySuUbHIQp
         rm+01BunAtt0XZu4r018eKEF08mTjcoetSecoVzVxgBMyCwYPDDB9YberXqzu9gAGElx
         q3yrX4v9VI3RmhlYLszBUcc+d7w+JIuCAuEMCCYCKxXklDc0TBglv3hEBTajwz+s8tpG
         RRkQ==
X-Gm-Message-State: AOAM5318MfZDtQeXivxZKm5cMaCWkBh2aov/8T8CEOpC32/k0/uedDlZ
	q73Lz7Cj9Xn87m3TzGOyx7vr7DizOcoXdBgVXOM=
X-Google-Smtp-Source: ABdhPJwzckJByWvaeOIhGz7AG0Emcg+5bVhNI+FdU+AymtOOfUyLA4iv4VilzSvVBWJwIYDPqUc67CkqYF7aaeH3zDE=
X-Received: by 2002:a7b:c84b:: with SMTP id c11mr13785639wml.78.1590864000126;
 Sat, 30 May 2020 11:40:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200529151427.20272-1-JPEWhacker@gmail.com> <90DD68A5-0834-4C82-8A06-BC3972756CA3@arm.com>
 <6d6ccf5c-f134-1a15-e5eb-8f5e10d03832@gmail.com> <09986319-6338-471F-A0C1-5096F5ED7AA3@arm.com>
In-Reply-To: <09986319-6338-471F-A0C1-5096F5ED7AA3@arm.com>
From: "Joshua Watt" <JPEWhacker@gmail.com>
Date: Sat, 30 May 2020 13:39:49 -0500
Message-ID: <CAJdd5Gag=0HF8+5KiF0DoLG1WZs+0ngbnT7G8CS1dFa=ydqjoQ@mail.gmail.com>
Subject: Re: [meta-arm][PATCH] meta-arm: Remove meta-python dependency
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd <nd@arm.com>
Content-Type: multipart/alternative; boundary="0000000000009d11ba05a6e1e3ed"

--0000000000009d11ba05a6e1e3ed
Content-Type: text/plain; charset="UTF-8"

On Fri, May 29, 2020, 10:37 AM Bertrand Marquis <Bertrand.Marquis@arm.com>
wrote:

>
>
> > On 29 May 2020, at 16:32, Joshua Watt <JPEWhacker@gmail.com> wrote:
> >
> >
> > On 5/29/20 10:21 AM, Bertrand Marquis wrote:
> >>
> >>> On 29 May 2020, at 16:14, Joshua Watt via lists.yoctoproject.org
> <JPEWhacker=gmail.com@lists.yoctoproject.org> wrote:
> >>>
> >>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> >>> ---
> >>> meta-arm/conf/layer.conf | 3 +--
> >>> 1 file changed, 1 insertion(+), 2 deletions(-)
> >>>
> >>> diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
> >>> index d96e9f1..1c241d4 100644
> >>> --- a/meta-arm/conf/layer.conf
> >>> +++ b/meta-arm/conf/layer.conf
> >>> @@ -11,6 +11,5 @@ BBFILE_PRIORITY_meta-arm = "6"
> >>>
> >>> LAYERDEPENDS_meta-arm = " \
> >>>     core \
> >>> -    meta-python \
> >>> "
> >>> -LAYERSERIES_COMPAT_meta-arm = "warrior zeus dunfell"
> >>> +LAYERSERIES_COMPAT_meta-arm = "gatesgarth"
> >> Could you explain why you want to remove dunfell compatibility ?
> >
> > dunfell doesn't have the required python recipes in oe-core, so it isn't
> compatible with it anymore.
>
> Nothing has been tested or is compatible with gatesgarth right now so this
> change will really have a breaking impact.
>

Right, you certainly wouldn't want to backport it to the dunfell branch;
this is just for master where the next release would be gatesgarth anyway.

Also, with the qemu support I added, I think we have reasonable testing
coverage on meta-arm, and in particular enough to have high confidence in
this change.

Finally, FWIW, upstream oe-core and meta-python have already made these
changes on their master branches, so it seems like we wouldn't want a
useless dependency on meta-python in meta-arm, *especially* if the idea is
to get other bsp layers to depend on meta-arm to consolidate things like
TF-A and optee.


> Bertrand
>
> >
> >
> >>
> >> Bertrand
> >>
> >>> --
> >>> 2.17.1
> >>>
> >>> 
>
>

--0000000000009d11ba05a6e1e3ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, May 29, 2020, 10:37 AM Bertrand Marquis &lt;<a=
 href=3D"mailto:Bertrand.Marquis@arm.com">Bertrand.Marquis@arm.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
&gt; On 29 May 2020, at 16:32, Joshua Watt &lt;<a href=3D"mailto:JPEWhacke=
r@gmail.com" target=3D"_blank" rel=3D"noreferrer">JPEWhacker@gmail.com</a>&=
gt; wrote:<br>
&gt; <br>
&gt; <br>
&gt; On 5/29/20 10:21 AM, Bertrand Marquis wrote:<br>
&gt;&gt; <br>
&gt;&gt;&gt; On 29 May 2020, at 16:14, Joshua Watt via <a href=3D"http://l=
ists.yoctoproject.org" rel=3D"noreferrer noreferrer" target=3D"_blank">list=
s.yoctoproject.org</a> &lt;JPEWhacker=3D<a href=3D"mailto:gmail.com@lists.y=
octoproject.org" target=3D"_blank" rel=3D"noreferrer">gmail.com@lists.yocto=
project.org</a>&gt; wrote:<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@g=
mail.com" target=3D"_blank" rel=3D"noreferrer">JPEWhacker@gmail.com</a>&gt;=
<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt; meta-arm/conf/layer.conf | 3 +--<br>
&gt;&gt;&gt; 1 file changed, 1 insertion(+), 2 deletions(-)<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.c=
onf<br>
&gt;&gt;&gt; index d96e9f1..1c241d4 100644<br>
&gt;&gt;&gt; --- a/meta-arm/conf/layer.conf<br>
&gt;&gt;&gt; +++ b/meta-arm/conf/layer.conf<br>
&gt;&gt;&gt; @@ -11,6 +11,5 @@ BBFILE_PRIORITY_meta-arm =3D &quot;6&quot;<=
br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; LAYERDEPENDS_meta-arm =3D &quot; \<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0core \<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 meta-python \<br>
&gt;&gt;&gt; &quot;<br>
&gt;&gt;&gt; -LAYERSERIES_COMPAT_meta-arm =3D &quot;warrior zeus dunfell&q=
uot;<br>
&gt;&gt;&gt; +LAYERSERIES_COMPAT_meta-arm =3D &quot;gatesgarth&quot;<br>
&gt;&gt; Could you explain why you want to remove dunfell compatibility ?<=
br>
&gt; <br>
&gt; dunfell doesn&#39;t have the required python recipes in oe-core, so i=
t isn&#39;t compatible with it anymore.<br>
<br>
Nothing has been tested or is compatible with gatesgarth right now so this=
 change will really have a breaking impact.<br></blockquote></div></div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Right, you certainly wouldn&#39;=
t want to backport it to the dunfell branch; this is just for master where =
the next release would be gatesgarth anyway.</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">Also, with the qemu support I added, I think we have r=
easonable testing coverage on meta-arm, and in particular enough to have hi=
gh confidence in this change.</div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Finally, FWIW, upstream oe-core and meta-python have already made the=
se changes on their master branches, so it seems like we wouldn&#39;t want =
a useless dependency on meta-python in meta-arm, *especially* if the idea i=
s to get other bsp layers to depend on meta-arm to consolidate things like =
TF-A and optee.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div cla=
ss=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Bertrand<br>
<br>
&gt; <br>
&gt; <br>
&gt;&gt; <br>
&gt;&gt; Bertrand<br>
&gt;&gt; <br>
&gt;&gt;&gt; -- <br>
&gt;&gt;&gt; 2.17.1<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; <br>
<br>
</blockquote></div></div></div>

--0000000000009d11ba05a6e1e3ed--
