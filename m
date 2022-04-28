Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 510C1C433FE
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 19:03:30 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web10.1042.1651172599754384042
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 28 Apr 2022 12:03:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=3AmEEIUI;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.173,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f173.google.com with SMTP id t11so4170944qto.11
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 28 Apr 2022 12:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UcnfWnu75fKrnEN15JM2WqAzJafvD2XLw47BeUFtDDc=;
        b=3AmEEIUIxSy4DkMRzLvL+HG5uvzLD0A5o2ueJ+db0Mq6/yPVkxekR7tT89N9J7dr2O
         2+De7IvWzXJo4lkfYDAvuBqGds97rJIV2dsfhw/X2ooAqJWu45gDjadaQ75KzEH/VerC
         giiGUCqWV4mxw9PdXkP1t01y84VHh2rOXSV8XKM61d1BaWxNSK0m1ckW9HDqumfT4WCk
         AZcl82Hg9EawsO0MRrxAIzs3glhyud5Hh4qiHwPK6Z25IRAZF3Xxpr9PzD9H7YJHekdj
         5maV3ohK5k2SiXiOuOkmhqTpMFMyTp/BbsdfXl8MlFBPIgmXmyo3IfJdaPm70D0QtHdv
         PbUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UcnfWnu75fKrnEN15JM2WqAzJafvD2XLw47BeUFtDDc=;
        b=WL3fgAYhr4yUeda4ZDuY4JCw8xnU1LAdmE7UB0ggPY3etqDAmTSYOFxLwMXfqHba4n
         ntccukzeskb5lqL5E6h9wF+dTjU16GmyQjDIWOQLBrYXWVZzUS1bhYZZzIiP4GbRO0uM
         dlsjEmQ1FxuPMULhUevdLvcuiETkOvLeqb+P2PifVF6XowvLFP46xcOFMk+jQsQDGuKS
         KE4v3TJZYw5klGozyQspm4ZH0mNiZ+SvS0y5o55WdkNK2j8HS6WmlKz45Gd4K3nKrYXU
         n8N2JavEg/AAQwegiepU7/JR91QE1YRiZm2sdTzAqrz0CseFtbDiTfw13P4LrpsWL7fy
         MNcQ==
X-Gm-Message-State: AOAM533rmKgZADcm1PPsx501kaS4TFG0ItDCvTpRT/HYQz5I12R2PhPh
	hihiVhjEBwWuJROGXTBTccJJqw==
X-Google-Smtp-Source: 
 ABdhPJzy/y9wXIMJpjvp9joT4d2Nl17sOZgVGRHTzHXVb/QjVhblSTNA4esBrBy6OmVuw7IgmDhQmg==
X-Received: by 2002:a05:622a:1b86:b0:2f3:358e:1511 with SMTP id
 bp6-20020a05622a1b8600b002f3358e1511mr24451943qtb.10.1651172598241;
        Thu, 28 Apr 2022 12:03:18 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id
 m10-20020a05620a24ca00b0069fb3a27f80sm485921qkn.39.2022.04.28.12.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 12:03:17 -0700 (PDT)
Date: Thu, 28 Apr 2022 15:03:16 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Sumit Garg <sumit.garg@linaro.org>, meta-arm@lists.yoctoproject.org,
	jon.mason@arm.com, ross.burton@arm.com, daniel.thompson@linaro.org
Subject: Re: [PATCH 1/2] external-arm-toolchain-versions: Use ldd to get libc
 version
Message-ID: <Ymrk9HYsLWJjeerC@kudzu.us>
References: <20220428122848.3941460-1-sumit.garg@linaro.org>
 <20220428140001.GM9834@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220428140001.GM9834@denix.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 28 Apr 2022 19:03:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3327

Sumit, 
It passes my CI.  Can you answer Denys's question below?

WE're going to cut the branch tomorrow, and I'd really like to get
this in.  However, if it's not ready, we'll push it to the next
release.

Thanks,
Jon

On Thu, Apr 28, 2022 at 10:00:01AM -0400, Denys Dmytriyenko wrote:
> On Thu, Apr 28, 2022 at 05:58:47PM +0530, Sumit Garg wrote:
> > Arm GCC 11.2 binary release has moved away from keeping libc library
> > versioning info as libc-{EAT_VER_LIBC}.so. So rather switch to
> > retrieving libc version by parsing output from "$ ldd --version".
> > 
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >  .../external-arm-toolchain-versions.inc       | 43 ++++++++-----------
> >  1 file changed, 17 insertions(+), 26 deletions(-)
> > 
> > diff --git a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
> > index a89f2f0..388987a 100644
> > --- a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
> > +++ b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
> > @@ -50,37 +50,28 @@ def eat_get_gcc_version(d):
> >  
> >  def eat_get_libc_version(d):
> >      import os,bb
> > +    import subprocess
> > +
> >      syspath = bb.data.expand('${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}', d)
> >      if not syspath:
> >          return 'UNKNOWN'
> >  
> > -    libpath = syspath + '/libc/' + bb.data.expand('${EAT_LIBDIR}/${EAT_TARGET_SYS}/', d)
> > -
> > -    if os.path.exists(libpath):
> > -        for file in os.listdir(libpath):
> > -            if file.find('libc-') == 0:
> > -                return file[5:-3]
> > -
> > -    libpath = syspath + '/libc/' + bb.data.expand('${EAT_LIBDIR}/', d)
> > -
> > -    if os.path.exists(libpath):
> > -        for file in os.listdir(libpath):
> > -            if file.find('libc-') == 0:
> > -                return file[5:-3]
> > -
> > -    libpath = syspath + '/libc/usr/' + bb.data.expand('${EAT_LIBDIR}/${EAT_TARGET_SYS}/', d)
> > -
> > -    if os.path.exists(libpath):
> > -        for file in os.listdir(libpath):
> > -            if file.find('libc-') == 0:
> > -                return file[5:-3]
> > -
> > -    libpath = syspath + '/libc/usr/' + bb.data.expand('${EAT_LIBDIR}/', d)
> > +    topdir = d.getVar('TOPDIR', True)
> > +    lddpath = syspath + '/libc/usr/bin/ldd'
> > +
> > +    if os.path.exists(lddpath):
> > +        cmd1 = 'sed -i -e \'s#/usr/bin/bash#/bin/bash#\' ' + lddpath
> 
> Are you trying to sed-in-place ldd executable, which is relative to 
> ${EXTERNAL_TOOLCHAIN} that can be installed system-wide w/o necessary 
> permissions?
> 
> 
> > +        cmd2 = lddpath + ' --version'
> > +        try:
> > +            stdout, stderr = bb.process.run(cmd1, cwd=topdir, stderr=subprocess.PIPE)
> > +            stdout, stderr = bb.process.run(cmd2, cwd=topdir, stderr=subprocess.PIPE)
> > +        except bb.process.CmdError as exc:
> > +            bb.error('Failed to obtain external Arm libc version: %s' % exc)
> > +            return 'UNKNOWN'
> > +        else:
> > +            first_line = stdout.splitlines()[0]
> > +            return first_line.split()[2]
> >  
> > -    if os.path.exists(libpath):
> > -        for file in os.listdir(libpath):
> > -            if file.find('libc-') == 0:
> > -                return file[5:-3]
> >      return 'UNKNOWN'
> >  
> >  def eat_get_kernel_version(d):
> > -- 
> > 2.17.1
> > 
> 
> -- 
> Regards,
> Denys Dmytriyenko <denis@denix.org>
> PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
> Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
> 

