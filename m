Return-Path: <gmshastri@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 838DCD5E12D
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 04:48:02 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.6015.1731041277262198423
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 Nov 2024 20:47:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vj5ZZgx2;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: gmshastri@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2e2bb1efe78so1335055a91.1;
        Thu, 07 Nov 2024 20:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731041277; x=1731646077; darn=lists.yoctoproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YX3vzQilcYburxmPewh6yYYKMloP1Ufxv4KiOSi2BlI=;
        b=Vj5ZZgx21vBdfeC++Sj/jMrS+A837tf4XxW64PDf9CSeoynr36MXRLT7QMR4oPheeB
         lkv4AZeV/AvqYOtJuY8P5HBfNZfuKHuTvV4+PvfY7E8KcIaTytOC0ZWI/LezCSB1k+mc
         WFf39722G/tKgOoXDwIjHp1romnNWYQgK7VgyC1T1xKM864unIzoWSp9axrkaZqaqUrl
         sYUnENYJ93UVrS0xnyntE0hdZb1y31KZLSm+8TmCTKacqFqoqk1HIEbjUSPXa8LXh5Fc
         DCEZ/i5bplK7H9hstjwPJYJHPfFcxEu3kdY9tGTp8F5bh2cEpiqI9R0hG1qgc50nFShd
         ELyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731041277; x=1731646077;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YX3vzQilcYburxmPewh6yYYKMloP1Ufxv4KiOSi2BlI=;
        b=t1YtNV4hOOLZmwY0vsDT5eccvQYs9lfjlmxaALoGYcFqdQmokw03TwwN/WGUCp9P6C
         YQ02xkaTA5g89kvIgJ2+89W8mWTXUBEnPadIbUiROuatOI4H7yFWi2hYx52xZfYrq4S5
         uoV4sqggSEOJveivN8RyvTGGC4uxkqfkPNTFHlEWYRXQWhqw3/kgcxLcInZ1MVVfG9LM
         v7qDmRwtwJJwTT6utIGOCc+BF9ntKDZPwoA83keX9wWevpBJplzeoZzQ4cFIufTzr0px
         TrJQY6jXqMPpUQ0d3ssYn7TbiU6BuSrltmc35jmX64ueROQVGnyal1bCht1G8U8WZ+D7
         x/SA==
X-Forwarded-Encrypted: i=1; AJvYcCUTuibyMV2OYB8E9HsPj1A3GtgLc5p+YOYPit77uG6hf2iGodmBFnEbWCGP3po/d1AnY9W1HNk=@lists.yoctoproject.org, AJvYcCVyLVAcfF0py/37U8tuYxFo60PigahCCT8y5LJFMN2Tc2SZFl+XaYjk2Ul7KORl9/3dlCV8ZDxquA==@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yy21idkOJV8c+yFAMnU+FuOZksOu6XEcuMOGUlbUtc4ge7gx8vy
	FEeXmw+MY9F4sngMLGeipwm8u6gcvwGGYV7wntaobmMl6zSl6iCEzFlxKSx7H68H9+Alx1XFp/U
	p+bO3LED3lJZgVZEH7+rDr2F5ECM=
X-Google-Smtp-Source: AGHT+IGz9GeZMlIBTVfrh/cKtWlSNKLx4/PTF6gbvrAeoCwIm7x0Vo0csr2J/LXRrYQ3kjjl2BTlWu2L95/FuXR2Kq8=
X-Received: by 2002:a17:90b:1d8d:b0:2da:82d4:c63c with SMTP id
 98e67ed59e1d1-2e9b0a13c0emr1879637a91.4.1731041276514; Thu, 07 Nov 2024
 20:47:56 -0800 (PST)
MIME-Version: 1.0
From: Gaurang Shastri <gmshastri@gmail.com>
Date: Fri, 8 Nov 2024 10:17:45 +0530
Message-ID: <CAE_REAsGjqy43TvYmVsmfKyPe74isegRV2=c4K=vJsJD8a_o=g@mail.gmail.com>
Subject: [Kirkstone] lib32-gcc-sanitizers build failed for Multilib ARM
To: ross.burton@arm.com, meta-arm@lists.yoctoproject.org, 
	yocto@lists.yoctoproject.org, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000060dff006265f74f6"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 08 Nov 2024 04:48:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6247

--00000000000060dff006265f74f6
Content-Type: text/plain; charset="UTF-8"

Hi Team,

I am trying to build toolchain with AARCH64/ARM32 multilib support.

My configuration part of toolchain is as follows:
==

DEFAULTTUNE = "cortexa72"

require conf/machine/include/arm/armv8a/tune-cortexa72.inc


# multilib support

require conf/multilib.conf

MULTILIBS = "multilib:lib32"

DEFAULTTUNE:virtclass-multilib-lib32 = "armv7athf-neon"

==


With this when I tried to build "meta-toolchain", if fails with following
error messages:

==

|
../../../../../../../../../work-shared/gcc-11.4.0-r0/gcc-11.4.0/libsanitizer/sanitizer_common/sanitizer_li

nux.cpp: In fu

nction '__sanitizer::uptr __sanitizer::GetKernelAreaSize()':


|
../../../../../../../../../work-shared/gcc-11.4.0-r0/gcc-11.4.0/libsanitizer/sanitizer_common/sanitizer_linux.cpp:1024:1

: error: r7 cannot be used in 'asm' here


|  1024 | }

|       | ^

*|
../../../../../../../../../work-shared/gcc-11.4.0-r0/gcc-11.4.0/libsanitizer/sanitizer_common/sanitizer_linux.cpp:1024:1:
error: r7 cannot be used in 'asm' here*

| make[2]: Leaving directory
'/b/workspace/yocto/build/tmp/work/armv7at2hf-neon-pokymllib32-linux-gnueabi/lib32-gcc-sanitizers/11.4.0-r0/gcc-11.4.0/build.arm-pokymllib32-linux-gnueabi.arm-pokymllib32-linux-gnueabi/arm-pokymllib32-linux-gnueabi/libsanitizer/sanitizer_common'

| make[2]: *** [Makefile:617: sanitizer_linux.lo] Error 1

| make[1]: Leaving directory
'/b/workspace/yocto/build/tmp/work/armv7at2hf-neon-pokymllib32-linux-gnueabi/lib32-gcc-sanitizers/11.4.0-r0/gcc-11.4.0/build.arm-pokymllib32-linux-gnueabi.arm-pokymllib32-linux-gnueabi/arm-pokymllib32-linux-gnueabi/libsanitizer'

| make[1]: *** [Makefile:531: all-recursive] Error 1

| make: *** [Makefile:418: all] Error 2

| ERROR: oe_runmake failed

==

Is this a known issue? Is multilib supported for ARM64/32 combination? Or
do I need to use seperate machine/toolchain configuration for ARM32 build?

Regards,

Gaurang Shastri

--00000000000060dff006265f74f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Team,<div><br></div><div>I am trying to build toolchain=
 with AARCH64/ARM32 multilib support.</div><div><br></div><div>My configura=
tion part of toolchain is as=C2=A0follows:</div><div>=3D=3D</div><div>





<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;font-size-adjust:n=
one;font-kerning:auto;font-feature-settings:normal;font-stretch:normal;font=
-size:13px;line-height:normal;font-family:&quot;Helvetica Neue&quot;">DEFAU=
LTTUNE =3D &quot;cortexa72&quot;</p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;font-size-adjust:n=
one;font-kerning:auto;font-feature-settings:normal;font-stretch:normal;font=
-size:13px;line-height:normal;font-family:&quot;Helvetica Neue&quot;">requi=
re conf/machine/include/arm/armv8a/tune-cortexa72.inc</p>
<p class=3D"gmail-p2" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;font-size-adjust:n=
one;font-kerning:auto;font-feature-settings:normal;font-stretch:normal;font=
-size:13px;line-height:normal;font-family:&quot;Helvetica Neue&quot;;min-he=
ight:15px"><br></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;font-size-adjust:n=
one;font-kerning:auto;font-feature-settings:normal;font-stretch:normal;font=
-size:13px;line-height:normal;font-family:&quot;Helvetica Neue&quot;"># mul=
tilib support</p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;font-size-adjust:n=
one;font-kerning:auto;font-feature-settings:normal;font-stretch:normal;font=
-size:13px;line-height:normal;font-family:&quot;Helvetica Neue&quot;">requi=
re conf/multilib.conf</p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;font-size-adjust:n=
one;font-kerning:auto;font-feature-settings:normal;font-stretch:normal;font=
-size:13px;line-height:normal;font-family:&quot;Helvetica Neue&quot;">MULTI=
LIBS =3D &quot;multilib:lib32&quot;</p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;font-size-adjust:n=
one;font-kerning:auto;font-feature-settings:normal;font-stretch:normal;font=
-size:13px;line-height:normal;font-family:&quot;Helvetica Neue&quot;">DEFAU=
LTTUNE:virtclass-multilib-lib32 =3D &quot;armv7athf-neon&quot;</p><p class=
=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-variant-=
east-asian:normal;font-variant-alternates:normal;font-size-adjust:none;font=
-kerning:auto;font-feature-settings:normal;font-stretch:normal;font-size:13=
px;line-height:normal;font-family:&quot;Helvetica Neue&quot;">=3D=3D</p><p =
class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-var=
iant-east-asian:normal;font-variant-alternates:normal;font-size-adjust:none=
;font-kerning:auto;font-feature-settings:normal;font-stretch:normal;font-si=
ze:13px;line-height:normal;font-family:&quot;Helvetica Neue&quot;"><br></p>=
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;font-size-adjust:n=
one;font-kerning:auto;font-feature-settings:normal;font-stretch:normal;font=
-size:13px;line-height:normal;font-family:&quot;Helvetica Neue&quot;">With =
this when I tried to build &quot;meta-toolchain&quot;, if fails with follow=
ing error messages:</p><p class=3D"gmail-p1" style=3D"margin:0px;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:no=
rmal;font-size-adjust:none;font-kerning:auto;font-feature-settings:normal;f=
ont-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;Helv=
etica Neue&quot;">=3D=3D</p><p>| ../../../../../../../../../work-shared/gcc=
-11.4.0-r0/gcc-11.4.0/libsanitizer/sanitizer_common/sanitizer_li</p><p>nux.=
cpp: In fu</p><p>nction &#39;__sanitizer::uptr __sanitizer::GetKernelAreaSi=
ze()&#39;: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0</p><p>| ../../../../../../../../../work-shared/gcc-11.4.0-r0/gcc-11.=
4.0/libsanitizer/sanitizer_common/sanitizer_linux.cpp:1024:1</p><p>: error:=
 r7 cannot be used in &#39;asm&#39; here =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</p><p>|=C2=A0 1024 | }</p><p>| =C2=A0 =C2=
=A0 =C2=A0 | ^</p><p><b>| ../../../../../../../../../work-shared/gcc-11.4.0=
-r0/gcc-11.4.0/libsanitizer/sanitizer_common/sanitizer_linux.cpp:1024:1: er=
ror: r7 cannot be used in &#39;asm&#39; here</b></p><p>| make[2]: Leaving d=
irectory &#39;/b/workspace/yocto/build/tmp/work/armv7at2hf-neon-pokymllib32=
-linux-gnueabi/lib32-gcc-sanitizers/11.4.0-r0/gcc-11.4.0/build.arm-pokymlli=
b32-linux-gnueabi.arm-pokymllib32-linux-gnueabi/arm-pokymllib32-linux-gnuea=
bi/libsanitizer/sanitizer_common&#39;</p><p>| make[2]: *** [Makefile:617: s=
anitizer_linux.lo] Error 1</p><p>| make[1]: Leaving directory &#39;/b/works=
pace/yocto/build/tmp/work/armv7at2hf-neon-pokymllib32-linux-gnueabi/lib32-g=
cc-sanitizers/11.4.0-r0/gcc-11.4.0/build.arm-pokymllib32-linux-gnueabi.arm-=
pokymllib32-linux-gnueabi/arm-pokymllib32-linux-gnueabi/libsanitizer&#39;</=
p><p>| make[1]: *** [Makefile:531: all-recursive] Error 1</p><p>| make: ***=
 [Makefile:418: all] Error 2</p><p class=3D"gmail-p1" style=3D"margin:0px;f=
ont-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alte=
rnates:normal;font-size-adjust:none;font-kerning:auto;font-feature-settings=
:normal;font-stretch:normal;font-size:13px;line-height:normal;font-family:&=
quot;Helvetica Neue&quot;"></p><p>| ERROR: oe_runmake failed</p><p>=3D=3D</=
p><p>Is this a known issue? Is multilib supported for ARM64/32 combination?=
 Or do I need to use seperate machine/toolchain configuration for ARM32 bui=
ld?</p><p class=3D"gmail-p1" style=3D"margin:0px;font:13px &quot;Helvetica =
Neue&quot;">Regards,</p><p>






</p><p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;f=
ont-variant-east-asian:normal;font-variant-alternates:normal;font-size-adju=
st:none;font-kerning:auto;font-feature-settings:normal;font-stretch:normal;=
font-size:13px;line-height:normal;font-family:&quot;Helvetica Neue&quot;">G=
aurang Shastri</p></div></div>

--00000000000060dff006265f74f6--

