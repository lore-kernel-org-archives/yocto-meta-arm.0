Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE75C25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 20:07:07 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.33537.1660766821513265966
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Aug 2022 13:07:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=bqvxF6yZ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.169,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f169.google.com with SMTP id cb8so11253103qtb.0
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Aug 2022 13:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=0h71gk1nmCr9k9dXMACh5bBTzpr07i6NUPHobcaPbN0=;
        b=bqvxF6yZl4rclRGcz9sLT2EqcQthQciUPNsBH93Gr/xSB6b8eGCCqokPnPRnv3jTPe
         OQ/7mNWPb6Yiv/pY4dmdemdfoRpHOrh0uZ9TcmXp7MtNxZFcIyC4tCtdciatbEYvfUn6
         SAjyMnWKLBfgu5ie7yTd2SALnCsYCgG2LMz4McharibkEmUmmI4gh/DCL6Sm8DnlzgEC
         r9IDT5NyabQHnEMJNLis9OxuwSisWgHFqPPXUHhtcyWn0nvAXoy2ug3/cchT/6+ICoH6
         i8Y0NTgtaXdFtv2GYJ5jQwdv6ccxnCB2NAHIK5NMofEUbxtyAfUPlLmGE/MddMBYFc7I
         TaWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=0h71gk1nmCr9k9dXMACh5bBTzpr07i6NUPHobcaPbN0=;
        b=2SB3Dr9fISXH0Xcck8NLNYc+zHSZlrXqGdOmt2zbcTELH+izo3XB8KxByjrL08HmX8
         Knk8JfnDlarJfuhYVbEXjpy9bUKwflEBzYT/9DswYag+vKWzTxHvjk8K9ixxXxCA1Eu0
         OovF8s4lfuo07s4ttn9+O8OkWejEOxF5zkqNB7ujHrKS3ZWZ572fEoxSJL85Apc49HPk
         YzgWQXPehRnylRdOy5nOpsSVaB92jkQAGy76kLN7vMh23kgXhAKBc0QAYBsm3xWb0T8X
         qHZ5edf3zFgzMtQucVuJq71Pzo/SiWCG0F7LEszDRtSP8Phb3yb+cWqa19m9SscS1UYY
         U3yQ==
X-Gm-Message-State: ACgBeo2jhFR0bzC07YIyzkStAbBXuFd+R7snCaln0vHPf3hVrT4ZfKIv
	ErFaDh6socq+B5Gi5uh4qMskRA==
X-Google-Smtp-Source: 
 AA6agR5E3hRXAV6iHBs9UDb31WCa6AaO8WGYgpXzXqCVguutWyr0YdVRcVoJMLCU6BPNVBqdJ8MbHQ==
X-Received: by 2002:aed:2793:0:b0:343:6d44:32b4 with SMTP id
 a19-20020aed2793000000b003436d4432b4mr24270303qtd.659.1660766820475;
        Wed, 17 Aug 2022 13:07:00 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 dm14-20020a05620a1d4e00b006bad20a6cfesm13686810qkb.102.2022.08.17.13.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 13:06:59 -0700 (PDT)
Date: Wed, 17 Aug 2022 16:06:58 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Ross Burton <ross.burton@arm.com>, Jon Mason <jon.mason@arm.com>,
	meta-arm@lists.yoctoproject.org, swat@lists.yoctoproject.org
Subject: Re: bitbake master fails to parse meta-gem5
Message-ID: <Yv1KYnAWuH+oCMc5@kudzu.us>
References: <Yvu83XlD7F4CkgDi@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yvu83XlD7F4CkgDi@mail.local>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 17 Aug 2022 20:07:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3703

On Tue, Aug 16, 2022 at 05:50:53PM +0200, Alexandre Belloni wrote:
> Hello,
> 
> Since the change in how bitbake handle classes, meta-gem5 fails to
> parse:
> 
> Parsing recipes...ERROR: ParseError at /home/pokybuild/yocto-worker/check-layer-nightly/build/meta-arm/meta-gem5/recipes-devtools/gem5/gem5-m5ops_20.bb:2: Could not inherit file classes/package.bbclass
> ERROR: Parsing halted due to errors, see error messages above
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/854/steps/13/logs/stdio

This is addressed by this patch
https://lists.yoctoproject.org/g/meta-arm/message/3684
which was pushed yesterday to the master branch.  So, you should not
be seeing this anymore.

Thanks,
Jon
> 
> 
> -- 
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 

