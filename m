Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92C5CC25B74
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 13:42:06 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.8945.1717076524431053727
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 May 2024 06:42:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=FeFVLG1b;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.128.173, mailfrom: jdmason@kudzu.us)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-62c5fd61d2bso9360347b3.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 30 May 2024 06:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1717076523; x=1717681323; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z7CcRP2yjYiRAhDfYTbSzNTOFeTOnaSxYoP19ogIG6o=;
        b=FeFVLG1b+Q03J6oDRHFtIhy6ywQrTTAzCFXlA2K48Gd11xtD7qeCJu5LgzCZTqKBPL
         Dr+/WYOUq6GOAGFVi2u64bt1V4jq+nuXLI4j7aPeKWCHBHAlJm6H6feISj888vajFMPv
         00piama3lqWIa6XZfjsuJob5cRQcAeeYVqR18/kOABz2de5LxygVLHnNvbRZIvaqR7S7
         pYz0OwqbXpR7I28PutTfs/v7cQQrKzNqcdDBMbu1Qcn82yB0DoMCeQKgcULx9QlslIld
         zBztU697C44XoKlaphDoTC/JDloUwh2mTU0Het1UiIR5/r6B20rVD71rsEaFvQ/c7CLf
         A46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717076523; x=1717681323;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z7CcRP2yjYiRAhDfYTbSzNTOFeTOnaSxYoP19ogIG6o=;
        b=cr/XW2jwoVaGssX6eCqFTkmq4DMBHOWSata/TTR2sqoZe5ED5bud+Fws6z6vJVv+w1
         k39v02LGXM9f0Ff9KzgFBMfN+h025mFEYItQuCrDzL/Ias/qMdgQPO+BbC2Hlryza2Xa
         fHm9HNB3zToMWZvrwzSF7VJFHWw2qfatpriSBMUCeGOoMmzhQDYwcJYEJs3hwwxV8eqS
         wgBQzbsIsaWgvsktAVDQ34u/dW9VEI2FvlW1brWmQclIngsSLiAMvXbANqCxldgVr+Yl
         +hLpivVX4xZDX4B7GuoQ0kocDeWw2f6RwVbGGDLl55rZZV5SUPyZ1hs7QsoPn9cdh9za
         jZrw==
X-Gm-Message-State: AOJu0Yxcb8z8EHMCb4ZdKlpa8kK/xAfyi8OeI6Uykux1evNMKHl4bGob
	9nTPiS9TzZRUnXHo1NYgp8URsgf0K9qoGE8zycrGUYgmo1mq9nmgkuLOwpezgQ==
X-Google-Smtp-Source: AGHT+IHfTJYBqlva3TorS8dXXFCkDWKbQ9pGH1sNxF6J9PuGUnZ/8gTV0Dg6MAImjJM/Dn7Q+1xX9Q==
X-Received: by 2002:a0d:ddd2:0:b0:609:efe8:2bfc with SMTP id 00721157ae682-62c7018e7f3mr12592407b3.27.1717076523534;
        Thu, 30 May 2024 06:42:03 -0700 (PDT)
Received: from kudzu.us ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-794abd31557sm552736985a.116.2024.05.30.06.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 06:42:03 -0700 (PDT)
Date: Thu, 30 May 2024 09:42:01 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Ryan Eatmon <reatmon@ti.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm][PATCH] test-pacbti: Use UNPACKDIR
Message-ID: <ZliCKRi6GoK9y+k/@kudzu.us>
References: <20240524193446.19066-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240524193446.19066-1-reatmon@ti.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 30 May 2024 13:42:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5778

On Fri, May 24, 2024 at 02:34:46PM -0500, Ryan Eatmon wrote:
> Fix parsing recipes error:
> 
>   Parsing recipes...
>   ERROR: meta-arm/recipes-test/pacbti/test-pacbti.bb: Using S = ${WORKDIR} is no longer supported
>   ERROR: Parsing halted due to errors, see error messages above
> 
> There was a change in oe-core [1] and was further discussed here [2].
> 
> [1]  https://git.openembedded.org/openembedded-core/commit/?h=master&id=32cba1cc916ad530c5e6630a927e74ca6f06289b
> [2] https://lists.openembedded.org/g/openembedded-architecture/message/2007
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>

Thanks for the patch.  I had a similar one queued internally, but I'll
take yours.  Unfortunately, we need to delay merging it for a couple
of weeks due.  This is due to the WORKDIR changes not working on
scarthgap and needing master to be pinned to scarthgap for an upcoming
BSP release.  I've added this patch to my gitlab master-next-master
branch (the name sucks, I know), and will push it to master once the
release occurs.

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
> 2.17.1
> 
> 

