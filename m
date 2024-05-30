Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B358DC25B74
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 13:44:06 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.8982.1717076639434344096
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 May 2024 06:43:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=UUhYTf/T;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-43fdb50b928so4782671cf.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 30 May 2024 06:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1717076638; x=1717681438; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qThh6aKr9XLpwKRRam25tv/83acvIszdVOI0dpaP3K0=;
        b=UUhYTf/TpufzCrwlt7LaX7WZzGrLP4YL700f9IajQyskeVnqCa3Z5+2Qjkth9RrXG/
         IKPPqMhsu+ZCmdmFeKcToQteTQb/GNHk8S26kEOnPwjuwXtJVQcTGNESwIcIqcFK9HnE
         c8FaLa3S5KMHeDPqOwmydWHZNunDPXfCwDSpT1jSrJcE6RF2tmwALaqQxg7PezPWtP1M
         AxI4CTTnXrk/Z0t17CV6e39OuYuXx1DvgpmeArqLI7ACz20qgm1HFrqsi0gqMGSu0nH7
         wRQMHCYbk3E/jk+iM/NoK1b/6K6ssZSd836flD5nBOGPau0Wdcry2rslN9NRY5q20ab6
         aM6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717076638; x=1717681438;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qThh6aKr9XLpwKRRam25tv/83acvIszdVOI0dpaP3K0=;
        b=cj63E2UA8N8y9H9JPxI715pkcrGgJ0CS/ZWQLruU4IWyjOzptOVyQw8IpAs14F6wzi
         KCO5ep8xWoA2vfHJ1+3UzhlynCefL7N8TKGeSD8+OMIKtyJ1ckVcqtfGFFLgDrvYWOE+
         mX+8fFYXLy5OstgrHZtbpjmnYAkWN3CbMew+unGKZlxCmRB1tByCETUqVySloLOMzlsf
         U+ZrPECW5XpI/lNS2uO5iTT1Awl9U/87cc+7H/Il0p+i+FalfRJyEIKA0Uf8/3+x+6/T
         foKyzlXuO5M8aDB3WNNC+ZNN6Wogz/l1s/CU89gXmhzY5KaY/DtGyJzSJf1veXYMmjqp
         wvCQ==
X-Gm-Message-State: AOJu0YyXr4Z9+KRfIRmkJmBP6gPrZQ8oxOc94H68+syG50j7co2T8H/W
	9a6JY4etJg5KNOsMlRt7Ur6GUxIP2sKEFMBIGmzQWxlYuHqFL0GzgYD2bWNzrQ==
X-Google-Smtp-Source: AGHT+IERQ0DRBWABC6oy44pW2iv2djWPf52qktX5p1FFURBqtCuw0QEI1i4K+SvYdPVqHeSf/yyujA==
X-Received: by 2002:ac8:5dcb:0:b0:43a:b1bf:4762 with SMTP id d75a77b69052e-43fe92ab7b0mr22238631cf.5.1717076638346;
        Thu, 30 May 2024 06:43:58 -0700 (PDT)
Received: from kudzu.us ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43feec4152bsm2851531cf.41.2024.05.30.06.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 06:43:58 -0700 (PDT)
Date: Thu, 30 May 2024 09:43:56 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [PATCH] test-pacbti: Switch away from S = WORKDIR
Message-ID: <ZliCnG/4z+x9axrZ@kudzu.us>
References: <20240527103734.2224649-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527103734.2224649-1-martin.jansa@gmail.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 30 May 2024 13:44:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5779

On Mon, May 27, 2024 at 12:37:34PM +0200, Martin Jansa wrote:
> * like oe-core did in:
>   https://git.openembedded.org/openembedded-core/commit/?id=d9328e3b0b062f0621de3d114584b44f384a1c02
> 
> * it's fatal for parsing now:
>   https://git.openembedded.org/openembedded-core/commit/?id=32cba1cc916ad530c5e6630a927e74ca6f06289b
>   ERROR: meta-arm/meta-arm/recipes-test/pacbti/test-pacbti.bb: Using S = ${WORKDIR} is no longer supported
>   ERROR: Parsing halted due to errors, see error messages above
> 
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>

Ryan sent a patch to address the same issue on Friday.  Since his was
first, I'll take that one.  Unfortunately, I need to delay applying it
for a couple of weeks due to an upcoming BSP release.

Thanks,
Jon

> ---
>  meta-arm/recipes-test/pacbti/test-pacbti.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arm/recipes-test/pacbti/test-pacbti.bb b/meta-arm/recipes-test/pacbti/test-pacbti.bb
> index 331c5854..b0ce1988 100644
> --- a/meta-arm/recipes-test/pacbti/test-pacbti.bb
> +++ b/meta-arm/recipes-test/pacbti/test-pacbti.bb
> @@ -4,7 +4,8 @@ LIC_FILES_CHKSUM = "file://pacbti.c;beginline=2;endline=2;md5=6ec41034e04432ee37
>  
>  SRC_URI = "file://pacbti.c"
>  
> -S = "${WORKDIR}"
> +S = "${WORKDIR}/sources"
> +UNPACKDIR = "${S}"
>  
>  do_compile() {
>      # Compile with -zforce-bti with fatal warnings, so the link fails if PAC/BTI
> -- 
> 2.45.1
> 
> 

