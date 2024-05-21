Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C32A9C25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 14:20:25 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.20870.1716301216508000345
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 May 2024 07:20:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=uNPZTIlQ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-43e2bca05e8so22927801cf.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 21 May 2024 07:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1716301215; x=1716906015; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=npM6bYUKZV8WuJPJF6qrzSUCEh/MnxOvciZBCYZ78xg=;
        b=uNPZTIlQnKSarO0y86zpei2RGEMM3B4LExXTlZzA+JSCXobQrTDBP9xTp5M/DuwDg+
         Mf7ACTvhHk6KHHSaixA+hs15w2INiWmv4j8rBPEGV2soVMIdV0CAQTo+4ZnHPdyH1Ics
         +Mmjg+7DWi1pPq1IoX44V70rlFV72brevXz4l/3PqCj9cCz0u92JBVsAgHsGrmfAHojy
         nxGO/8gJnogZxNE6bT/dtoTJKUibLeajBuZvf/dvdqWZ17dH+ghkslEPTTfC4vBrGYW0
         4bMR7uW9IZUucgzbui+k+ScPGQczL/IO+0hYx9kMfU4C9NIhc3wRn8wXkbBn4Vmg9syp
         rbww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716301215; x=1716906015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=npM6bYUKZV8WuJPJF6qrzSUCEh/MnxOvciZBCYZ78xg=;
        b=DRXEwqoWUIPoKx4z1/eOsghVFCclXOrcq/d3B/DNh6iPTneyj/uegoU97wjQ29Ukci
         BqOz1IPwOuYKohi6nHIHdh6BG0WgpgPa7lO+6X1wy+cFqRLS27M5tS6SEBs3pdo5N4mt
         wgvtvoKNlgpn9iWqsZG2/k29CMhqTHQhao5HToCax56pRjrEvp3/HKb3+dJcGFljFD1r
         VARWOmqak6zCH1GZdJQ2reLHa6qngqn/WpkYnnagY6yLnKVnt8tJGxhaLGB2IG77Lfgj
         /XnNB4Bsxm8058ZL/TzNF/2Q4dmCce/GUVWyIpsd1AvHuW8YyICdwK9tYRGffbMIF1T8
         7xeg==
X-Gm-Message-State: AOJu0YyoM57GTU7O1ZF2NA0iueDrrVCNrlYyFod/OGdbUMXKilUL/b+9
	xc4wl35V6WqhVqA+tna9XGhM+wiJkAoL8paos/rx+NlNvVsft43AxyXc05rU1P0/qwmScjD9szE
	=
X-Google-Smtp-Source: AGHT+IHIepA/k5e2JfSFcxYb1A2iE8+VhpcQ+V5y6UUCFJPaighxrbO2LBNmHY4dIFM10pGvZohOxg==
X-Received: by 2002:ac8:5a56:0:b0:435:f8f0:2940 with SMTP id d75a77b69052e-43dfdae2197mr345057821cf.22.1716301215356;
        Tue, 21 May 2024 07:20:15 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43e15fe0f65sm120841031cf.37.2024.05.21.07.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 07:20:15 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	ali.oezaslan@arm.com
Subject: Re: [PATCH 0/2] corstone1000: fix crypto and iat psa failures
Date: Tue, 21 May 2024 10:19:44 -0400
Message-Id: <171630119063.2318166.3478257602150205458.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240516154029.13881-1-ali.oezaslan@arm.com>
References: <20240516154029.13881-1-ali.oezaslan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 21 May 2024 14:20:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5738


On Thu, 16 May 2024 16:40:27 +0100, ali.oezaslan@arm.com wrote:
> From: Ali Can Ozaslan <ali.oezaslan@arm.com>
> 
> * The psa-iat-api-test was failing because the PLATFORM_HAS_ATTEST_PK
> flag was added to the build for Corstone1000.
> 
> * Crypto-AEAD-APIs tests fails on mps3. Configures CC312 mps3 model
> same as predefined cc312 FVP configuration while keeping debug
> ports closed.
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/trusted-firmware-m: corstone1000: fix crypto failure on mps3
      commit: 611909cd6db60724db26cf9649e7f23abc1c414e
[2/2] arm-bsp/trusted-services: corstone1000: fix IAT test
      commit: 679218cd848b2c4a6e886633c0d0af266a4f6ba6

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

