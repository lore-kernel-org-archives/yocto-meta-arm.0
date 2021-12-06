Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63B61C433F5
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 21:59:13 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.58671.1638827952550436484
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Dec 2021 13:59:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=ZD6jBf1Q;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.175,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f175.google.com with SMTP id z9so12337662qtj.9
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Dec 2021 13:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hLGhRjyroKTXPo0IgsDN/R2eGK3e9J6oxHNIAaC1RMg=;
        b=ZD6jBf1QdpGES56AlpMH2nCaGlVf6OVH9SLgd/JOeQH5KSp8bizRFs91GZ31xHxXV9
         R8tabOzTsbNof5Y/i0Qnrf77pR6kAo0q1sv10IvN7GXQu7CxWocwev5K1S83kjh0ZN3n
         8BhFDIN1SNSVsMKFm737AvdyH1zMLcURZrbUdQAEQzHOB4eXrI+bC6Y4sCp5Iz+5lFi6
         8L+SWSafmc1lZHhmDGzjs+GwzLM306VrN/2YzOCWtmpZvirEOFEIk1DSKMgdno08gyJX
         yCb5tLRT9eaObkJjMDtybdO26MlztwqLvcONNcEbUD3TI3MEzv++ACX2xk8YavH4Dazf
         amRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hLGhRjyroKTXPo0IgsDN/R2eGK3e9J6oxHNIAaC1RMg=;
        b=rFly4WuSvj2fLJ+euue2N1eSP1TJ9Tcn8jPbSIMtvSdLuDJgDItHUwufE02IbVaCrM
         8lYBhApLM1puzAEPhS13zr+DT3bblm1bFauWwt4DsJQN7inGLshhoP796FQZ4WzHv4FY
         t1OBwQpCwejlYXC7A963h/298rasFoUEYxJjLs1aqvis3oXOBFTDeorc8syTxxdBUTfl
         NLCGDXpVytoS4mx5ooN1bzRX5Mln4vUXEXWJybJBQherHoBQF+bh28P+cy7c8PDZd3p3
         Kgf3ARwXDKWXtPr2jsw6WUvf+89bB2aleNnJyvaMRk9n8hoyXNd9OZrJt/sJzAxj5bm4
         uucA==
X-Gm-Message-State: AOAM531P/ymUr/0ELuozjMfU2RRphVWH3mHtG03vvlJ53pa3NZmLFHqf
	qsNRNf+pn7jf2WtPEJLhs7b4Dx+qUOXyxw==
X-Google-Smtp-Source: 
 ABdhPJxdpNi7fFiya6JQb7QiUEFOt4VIX4Yk8A4CA+2Iw/oRWpa/bS2S9MOWBGDjv05sxaGMU7yW0A==
X-Received: by 2002:ac8:7f43:: with SMTP id g3mr42848074qtk.127.1638827951638;
        Mon, 06 Dec 2021 13:59:11 -0800 (PST)
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id
 139sm6839908qkn.37.2021.12.06.13.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 13:59:11 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH] optee-ftpm: Limit to supported machines
Date: Mon,  6 Dec 2021 16:57:59 -0500
Message-Id: <163882776940.28346.12031732490256593010.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211204012120.199942-1-raj.khem@gmail.com>
References: <20211204012120.199942-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 06 Dec 2021 21:59:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2553

On Fri, 3 Dec 2021 17:21:20 -0800, Khem Raj wrote:
> If we build aarch64 based machines living outside meta-arm then these
> recipes report as unsupported e.g.
> 
> ERROR: Nothing PROVIDES 'optee-os-tadevkit' (but /mnt/b/yoe/master/sources/meta-arm/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb DEPENDS on or otherwise requires it)
> optee-os-tadevkit was skipped: incompatible with machine rock-pi-4b (not in COMPATIBLE_MACHINE)
> ERROR: Nothing RPROVIDES 'optee-ftpm' (but /mnt/b/yoe/master/sources/meta-arm/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb RDEPENDS on or otherwise requires it)
> No eligible RPROVIDERs exist for 'optee-ftpm'
> NOTE: Runtime target 'optee-ftpm' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['optee-ftpm']
> ERROR: Nothing RPROVIDES 'optee-ftpm-dev' (but /mnt/b/yoe/master/sources/meta-arm/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb RDEPENDS on or otherwise requires it)
> No eligible RPROVIDERs exist for 'optee-ftpm-dev'
> NOTE: Runtime target 'optee-ftpm-dev' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['optee-ftpm-dev']
> 
> [...]

Applied, thanks!

[1/1] optee-ftpm: Limit to supported machines
      commit: bf0b41be6a40f4fe9ddb2336d63c33d966d5287f

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

