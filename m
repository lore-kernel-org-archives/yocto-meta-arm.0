Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E38DC25B0C
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 15:16:29 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web08.26562.1659971782554159847
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Aug 2022 08:16:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=ACz50awS;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.178,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f178.google.com with SMTP id d8so2047380qkk.1
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Aug 2022 08:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=DLmvLvGCQbYGbifcKULRcSXgBpdFERLAGVJB66j4674=;
        b=ACz50awSGdGKjB6T6/7ZcyBtn15cGQdrLuawFk++uXPZPjzeWN/SUXVPhzpcQCQgYF
         gJ6L0mPlbfg71nYQN8WF1DlxxSieiZZKJ/mgnbHrUqk7tHPsTH+3n4EY72B1jfw/2V6Q
         hM0eEg2+E6pjPsnYmpPQEEcXwjwBAFqm7jRAY65LDZrHurvC3ZMcZt2CntY+GUPoU6h0
         EUAuWkYg6LERbJcUHDwuMtTTvglwDiwUkAI/OKyBu/IRHOSFh4F7uQ7CgOc7v78bgMh0
         wjKWlc/+uMLuF1clq3L0rlI6jLmUbZXPmGMh/BaInwOJL86PmFzNyU5XK4DxfmTeZk3c
         8lTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=DLmvLvGCQbYGbifcKULRcSXgBpdFERLAGVJB66j4674=;
        b=LryDuQTTdvgGHppapphlJ2IlnYGC72pyn6hNZ2WoV9Mz/+ob+isfT1ks1/mXytMqSD
         9Eg7id5Q5vk70qFs+5Va7oIqhqFgWXBoNFAbKggxg5YIApjzyO6IEZNuX9Th5bV1AWmZ
         ZYNI/BYqri3fSibuIKfa3zPFe27y6jomQKK2RODcneD6i8OIHwH74dsREY5sUJDK2m2C
         gPqidc3aJ/cXCHw46o9x8OOCqeWbhbIcMy7v8K8f0CfG7mAyqmOVGXSzoJR8lsDiT1rR
         LdM7aIeGxkWBGrXSTZYZS3tzOhSIOPwvV7XFyJNeeSj/YgNQauCXWotsxv66vAwlVP6n
         E1MQ==
X-Gm-Message-State: ACgBeo11ph0ZrFQ4PLK7BPnvTxlJJb4e5J73y16Mbzq97zdIRi0SRAo4
	OYtNBrJka6if7jFtI3Y+JQ78yA==
X-Google-Smtp-Source: 
 AA6agR4lb6K4f4hMgwZ8ba4jqvlAHcPaj2n4rX95l57yzDje9ywJktKj+bzt1FOW2BiUtXs8czKxHQ==
X-Received: by 2002:ae9:e606:0:b0:6b5:d2a3:7fd0 with SMTP id
 z6-20020ae9e606000000b006b5d2a37fd0mr13887143qkf.343.1659971781573;
        Mon, 08 Aug 2022 08:16:21 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 w21-20020a05622a135500b0031bf484079esm4560923qtk.18.2022.08.08.08.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 08:16:20 -0700 (PDT)
Date: Mon, 8 Aug 2022 11:16:19 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Sumit Garg <sumit.garg@linaro.org>,
	Martin Jansa <martin.jansa@gmail.com>,
	meta-arm@lists.yoctoproject.org, Ross Burton <ross.burton@arm.com>,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [meta-arm] [PATCH][kirkstone] arm-toolchain/layer.conf: remove
 BB_DANGLINGAPPENDS_WARNONLY
Message-ID: <YvEow+IRcFr6yVv0@kudzu.us>
References: <20220804094231.748681-1-Martin.Jansa@gmail.com>
 <YuvENV7uaKfqmOat@kudzu.us>
 <CAFA6WYPBThQ_ei8dEx=TQ-T-sGHyBZYge4ZyGZz86htB78Jr_Q@mail.gmail.com>
 <20220804154720.GH18692@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220804154720.GH18692@denix.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 08 Aug 2022 15:16:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3652

On Thu, Aug 04, 2022 at 11:47:20AM -0400, Denys Dmytriyenko wrote:
> On Thu, Aug 04, 2022 at 06:37:09PM +0530, Sumit Garg wrote:
> > Hi Jon,
> > 
> > On Thu, 4 Aug 2022 at 18:36, Jon Mason <jdmason@kudzu.us> wrote:
> > >
> > > Odd email format.  I beleive you are asking me to apply this patch to
> > > kirkstone.  If not, please let me know.
> > >
> > > Sumit/Denys, should I apply this all the way back to dunfell (as the
> > > grub entry is there in this oldest branch)?
> > >
> > 
> > Yeah, it makes sense.
> 
> I agree - this hasn't been needed for quite some time.
> 

Removing it has found a bug (of course).  Testing a fix now.  Sorry
for the delay.

Thanks,
Jon

> -- 
> Denys
> 
> 
> > > On Thu, Aug 04, 2022 at 11:42:31AM +0200, Martin Jansa wrote:
> > > > From: Ross Burton <ross.burton@arm.com>
> > > >
> > > > This appears to be historical from when the toolchain was in meta-linaro.
> > > >
> > > > It isn't needed anymore, there's one bbappend in meta-arm-toolchain for
> > > > grub which is part of oe-core, so will never be dangling.
> > > >
> > > > This variable has a global effect, so leaving it in here has a negative
> > > > impact on users.
> > > >
> > > > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > > > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > > > ---
> > > >  meta-arm-toolchain/conf/layer.conf | 3 ---
> > > >  1 file changed, 3 deletions(-)
> > > >
> > > > diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf/layer.conf
> > > > index 3512c34..dd54db8 100644
> > > > --- a/meta-arm-toolchain/conf/layer.conf
> > > > +++ b/meta-arm-toolchain/conf/layer.conf
> > > > @@ -11,8 +11,5 @@ BBFILE_PRIORITY_arm-toolchain = "5"
> > > >  LAYERDEPENDS_arm-toolchain = "core"
> > > >  LAYERSERIES_COMPAT_arm-toolchain = "kirkstone"
> > > >
> > > > -# do not error out on bbappends for missing recipes
> > > > -BB_DANGLINGAPPENDS_WARNONLY = "true"
> > > > -
> > > >  # These variables are used for armcompiler license
> > > >  BB_BASEHASH_IGNORE_VARS:append = " ARM_TOOL_VARIANT ARMLMD_LICENSE_FILE LM_LICENSE_FILE"
> > > > --
> > > > 2.35.1
> 

