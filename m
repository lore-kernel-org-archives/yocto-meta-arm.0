Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE543D6A255
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 22:50:08 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.7647.1731624603882141618
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 14 Nov 2024 14:50:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=Ke2Yu+Ez;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4609c9b39d0so926051cf.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 14 Nov 2024 14:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1731624603; x=1732229403; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tP7FM11UqHcAIKCLSPVaVkAt2PAukjNSUHXX6DzI85U=;
        b=Ke2Yu+EzEb9biiVt7e+U3fH24mr7WGPAKr+N1wDimhmRLyV3YmcE5WciffDux3Dlw1
         kNOxATZbn/8wIZn6/SEtaoD0+don0zCBFTaZ/uAF8v4GPSSxk63ZEaZpUMYFxfcmRnKG
         EDlr0e/XPYyj0SYX/tLtjaRTQ+DcGxZoqkvLlQtDSR4RqF2WIVDZ6RYTCSpPdgCrHxtX
         IrNtKYkkveaHbJ2u8SFogtnIABkXOWBCbD1uYXq2Eg3LmVe8o0X6dDqXdo2I8OJp3rKK
         4OhY8AnQDeIaE0OPrWdCHLsuYJX3ETfFVm9wlNdk0wwgA9Cz0Th989xxT/E6Ul3FAb5H
         npTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731624603; x=1732229403;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tP7FM11UqHcAIKCLSPVaVkAt2PAukjNSUHXX6DzI85U=;
        b=HTWEaOFbf6A/tivArdGpZ+snIigASdMprWzp3Vb73RGdtDOegx/kOfek/iFw8asUYl
         LZoqbztNNTmyrEEUBwzZLR0orb0jj0yQDpQaLoOF/3+rgO1tU7YRS0FGghdIKZ5NfFk1
         Yt6wYGkOl8olNjAn7jA6K2xuXI59YNtOO+zbIr9GAYG37nzQ+9RPq/jZIwPV84rhACs2
         azKzhiXNta2Y6jSChB0UIMVMcX3R0H4ZWSf4PJjzkTDJ2c/KWLY+zXLbbYEOto6qldb/
         JAMAE4QFDcjLhilSBHs2A4PcvhQY9tRE5drX73KvQXK21xVrt2tBSjcJxuinpUcvEluB
         9M/w==
X-Forwarded-Encrypted: i=1; AJvYcCVBvMozCNPNvXlQkwlgxtGKLLSca+PRlaiNDOS1EFc0MHT8ldUnPw50knnFZc+dOrZ9gFO9xfZSMQ==@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwNMnoG8j8xj0qFaXKxtuww/ijriuuW56n9GOv/cdsP8hxRubqJ
	904Fm9dQz74q8I23qDSKj5WHZPWtO98Aoz4I26QO1lRpQ4pdy6uSAtSg4qiUBg==
X-Google-Smtp-Source: AGHT+IF9qWbWE8ujQDKSe+/tEvm9ADFpOWCXpivbHotM5+JPvQEYiIb9V3OeO8fx1hBcMjMTsipYXQ==
X-Received: by 2002:ac8:5a52:0:b0:460:edba:3696 with SMTP id d75a77b69052e-46363e2833fmr7437881cf.29.1731624602814;
        Thu, 14 Nov 2024 14:50:02 -0800 (PST)
Received: from kudzu.us ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4635a9e97f4sm11434301cf.22.2024.11.14.14.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 14:50:02 -0800 (PST)
Date: Thu, 14 Nov 2024 17:50:00 -0500
From: Jon Mason <jdmason@kudzu.us>
To: Denys Dmytriyenko <denis@denix.org>
Cc: romain.naour@smile.fr, meta-arm@lists.yoctoproject.org,
	jon.mason@arm.com
Subject: Re: [meta-arm] [PATCH v2 1/8] external-arm-toolchain: remove old sed
 fixup for libc.so
Message-ID: <ZzZ-mOKHTBYX1t_T@kudzu.us>
References: <20241025165002.2794821-1-romain.naour@smile.fr>
 <20241101185522.GJ20070@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101185522.GJ20070@denix.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 14 Nov 2024 22:50:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6249

On Fri, Nov 01, 2024 at 02:55:22PM -0400, Denys Dmytriyenko wrote:
> FYI, Ross and I discussed the whole external toolchain support a while back 
> and we were under the impression that there were no users of it and he was 
> planning to deprecate the entire external toolchain support after Styhead was 
> out. I wonder if your patchset changes the plans...

As we now have a known user, let's keep meta-arm-toolchain around a
little longer.

> Either way, I reviewed your patches and they seem reasonable. I currently 
> don't have an active setup with external toolchain, so was not able to do any 
> testing yet.
> 
> If Jon is willing to run these through the CI paces, I won't mind giving my 
> Reviewed-by: stamp.

I ran it through CI, and it passes (sort of).  There is an issue with
QEMU 9.0.4, but when I regress that recipe to the previous version
then it passes.  Since that is outside the scope of this series, I've
queued these in master-next and added Denys' acked-by to each of them.

Thnks,
Jon

> 
> -- 
> Denys
> 
> 
> On Fri, Oct 25, 2024 at 06:49:55PM +0200, Romain Naour via lists.yoctoproject.org wrote:
> > As reported by Vasyl Vavrychuk [1], /${EAT_LIBDIR}/${EAT_TARGET_SYS}
> > is not present in libc.so in the latest prebuilt toolchains:
> > 
> > ARM32:
> >   $ cat ./gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf/arm-linux-gnueabihf/libc/usr/lib/libc.so
> >   OUTPUT_FORMAT(elf32-littlearm)
> >   GROUP ( /lib/libc.so.6 /usr/lib/libc_nonshared.a  AS_NEEDED ( /lib/ld-linux-armhf.so.3 ) )
> > 
> >   $ cat ./gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf/arm-none-linux-gnueabihf/libc/usr/lib/libc.so
> >   OUTPUT_FORMAT(elf32-littlearm)
> >   GROUP ( /lib/libc.so.6 /usr/lib/libc_nonshared.a  AS_NEEDED ( /lib/ld-linux-armhf.so.3 ) )
> > 
> >   $ cat ./arm-gnu-toolchain-12.3.rel1-x86_64-arm-none-linux-gnueabihf/arm-none-linux-gnueabihf/libc/usr/lib/libc.so
> >   OUTPUT_FORMAT(elf32-littlearm)
> >   GROUP ( /lib/libc.so.6 /usr/lib/libc_nonshared.a  AS_NEEDED ( /lib/ld-linux-armhf.so.3 ) )
> > 
> >   $ cat ./arm-gnu-toolchain-13.3.rel1-x86_64-arm-none-linux-gnueabihf/arm-none-linux-gnueabihf/libc/usr/lib/libc.so
> >   OUTPUT_FORMAT(elf32-littlearm)
> >   GROUP ( /lib/libc.so.6 /usr/lib/libc_nonshared.a  AS_NEEDED ( /lib/ld-linux-armhf.so.3 ) )
> > 
> > Aarch64:
> >   $ cat ./gcc-linaro-7.3.1-2018.05-x86_64_aarch64-linux-gnu/aarch64-linux-gnu/libc/usr/lib/libc.so
> >   OUTPUT_FORMAT(elf64-littleaarch64)
> >   GROUP ( /lib/libc.so.6 /usr/lib/libc_nonshared.a  AS_NEEDED ( /lib/ld-linux-aarch64.so.1 ) )
> > 
> >   $ cat ./gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/lib64/libc.so
> >   OUTPUT_FORMAT(elf64-littleaarch64)
> >   GROUP ( /lib64/libc.so.6 /usr/lib64/libc_nonshared.a  AS_NEEDED ( /lib/ld-linux-aarch64.so.1 ) )
> > 
> >   $ cat ./arm-gnu-toolchain-12.3.rel1-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/lib64/libc.so
> >   OUTPUT_FORMAT(elf64-littleaarch64)
> >   GROUP ( /lib64/libc.so.6 /usr/lib64/libc_nonshared.a  AS_NEEDED ( /lib/ld-linux-aarch64.so.1 ) )
> > 
> >   $ cat ./arm-gnu-toolchain-13.3.rel1-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/lib64/libc.so
> >   OUTPUT_FORMAT(elf64-littleaarch64)
> >   GROUP ( /lib64/libc.so.6 /usr/lib64/libc_nonshared.a  AS_NEEDED ( /lib/ld-linux-aarch64.so.1 ) )
> > 
> > We can safely remove old sed fixup for libc.so.
> > 
> > [1] https://lists.yoctoproject.org/g/meta-arm/message/5565
> > 
> > Signed-off-by: Romain Naour <romain.naour@smile.fr>
> > ---
> >  .../external-arm-toolchain/external-arm-toolchain.bb          | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> > index 1e8c1116..1095736b 100644
> > --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> > @@ -213,13 +213,13 @@ do_install() {
> >  	rm -rf ${D}${includedir}/rpcsvc/rquota.*
> >  
> >  	if [ -f ${D}${libdir}/libc.so ];then
> > -		sed -i -e "s# /${EAT_LIBDIR}/${EAT_TARGET_SYS}# ../../${EAT_LIBDIR}#g" -e "s# /usr/${EAT_LIBDIR}/# /usr/lib/#g" -e "s# /usr/${EAT_LIBDIR}/${EAT_TARGET_SYS}# .#g" -e "s# /${EAT_LIBDIR}/ld-linux# ../../${EAT_LIBDIR}/ld-linux#g" ${D}${libdir}/libc.so
> > +		sed -i -e "s# /usr/${EAT_LIBDIR}/# /usr/lib/#g" -e "s# /${EAT_LIBDIR}/ld-linux# ../../${EAT_LIBDIR}/ld-linux#g" ${D}${libdir}/libc.so
> >  		sed -i -e "s# /${EAT_LIBDIR}/libc.so.6# /lib/libc.so.6#g" ${D}${libdir}/libc.so
> >  		sed -i -e "s# /lib# ../../lib#g" -e "s# /usr/lib# .#g" ${D}${libdir}/libc.so
> >  	fi
> >  
> >  	if [ -f ${D}${base_libdir}/libc.so ];then
> > -		sed -i -e "s# /${EAT_LIBDIR}/${EAT_TARGET_SYS}# ../../lib#g" -e "s# /usr/${EAT_LIBDIR}/${EAT_TARGET_SYS}# .#g" -e "s# /${EAT_LIBDIR}/# /lib/#g" ${D}${base_libdir}/libc.so
> > +		sed -i -e "s# /${EAT_LIBDIR}/# /lib/#g" ${D}${base_libdir}/libc.so
> >  		if [ -f ${D}${base_libdir}/libc.so.6 ]; then
> >  			sed -i -e "s# /usr/${EAT_LIBDIR}/libc.so.6# /lib/libc.so.6#g" -e "s# /${EAT_LIBDIR}/libc.so.6# /lib/libc.so.6#g" ${D}${base_libdir}/libc.so.6
> >  		fi
> > -- 
> > 2.45.0
> 

