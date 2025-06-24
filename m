Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7568EC77B7C
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 19:31:52 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.5198.1750793510704205566
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 12:31:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=GoS5EsQt;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.44, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6fafd3cc8f9so86780616d6.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 24 Jun 2025 12:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1750793509; x=1751398309; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oIOZH4flbW3+STqrm25eOOeIvP2qN+MguYrziBks8K4=;
        b=GoS5EsQtyWPs00AP0u+D8ZgIaZvIjy3mfLxefOxEcSpLr9Idjjm68ukTlkbFI8WLqj
         08tKyaYj/RrfgfY/Wvz78L74eDJcvM2K7Lvt+OPcHQXXj+SZ7jwMaOmBv2EhGP9Fd2YN
         y738JWeYRHc3Umvy2hja2V99oqRR5EqyTWY6QUTgorH3Yrk1+hWKbfGPMUS1lh6xUX64
         rsQoJ/uT+o9hDERYUmpAdeTG9dvgZWZ1I/+efsP02AlqjRTC5xl78Lbe31BJmU6R8qtp
         0NzUeK1gZqedLxwGu82F+WEqKxF2EieMC0tCQTxhx2dl3SjTPPtO/xrKPj8n+jT/dWp1
         76CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750793509; x=1751398309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oIOZH4flbW3+STqrm25eOOeIvP2qN+MguYrziBks8K4=;
        b=nO9BBZ6xg59rsCNuKSda/ZdbvHd3tde3TnyMhQiY3yeBV7QrqFZJ27qlZYr/KSW/DH
         Ym2l/mKDULSuajDD5GkQD8f+bxWf9sxdlaOToaNI5JlHONkTCHJCyHkqe2/DWCu+5G+R
         ZFE/i721H29czfjH3CQPZ+Zg5KHzD1BcaaxrAOkFzXdXop9c4Wfh2z/6QNWPBWG7bneH
         yfP7azNX2y9xfVMKM7PraWMxDyhJuXZ113jgnX2MEq6t5LjLHr0VaTMmI4wCS2YegK9e
         QLYIco79M9+dOY2THMP2z0zg2hF81GoShHjGhre7u51017I0WWzvufMuUgDtdIiBk8Cu
         rdiA==
X-Gm-Message-State: AOJu0YytSNXqer6mOdK5QKg/3hGK87qaM+c/Q7dBTjvWQ7nWJd8heFg/
	LeBcXubxJjDBxkPzJhgG9KyjpDT3FHlF8TT+HAaqTCWvh9UWYQuGIFNk7qSVcZRwOQ8mqJFqnLE
	DkiA=
X-Gm-Gg: ASbGnctfeFp54w+4trUsCfj3NMgcvLvweAttcOZtieQmoWgE5nWecbr4n8fBawy8DC5
	xrZOH38U1Dmam5zgkawZnv2/shpu97sySpdqLC0do6UUYe4ONWWOc5kCTGh4Y4uve1gIwE7AR6F
	iMNbpOBNKC6QYa0vnyXlkAZMa5T4GKtaMffMXLOOWEwQ3+TcS/SGRkUwIBs5hyFxueXajcILklp
	HwumZ/C75PsuRMO59gsweC+Najq4V4XoADYB+TC4Cn/w9rk1dla9pbknuQ1RSUYiPdZ11lQUTy1
	n3h3GxPQvbEkmlMAWqqDM/elerRZYK4SJs9NUyNCdc8ABip4SI6+iQ==
X-Google-Smtp-Source: AGHT+IH8ldphIbR2euvu8ESbCFXosArE9cfDcHfWdAGUlWFvbZ1x5LDnEM/pmd9CMKGmimebblLkRw==
X-Received: by 2002:a05:6214:da3:b0:6fa:ab49:4482 with SMTP id 6a1803df08f44-6fd5ef940bamr1806636d6.35.1750793509265;
        Tue, 24 Jun 2025 12:31:49 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd093e00e7sm60339986d6.15.2025.06.24.12.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 12:31:48 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Yogesh Wani <yogesh.wani@arm.com>
Subject: Re: [PATCH 0/1] arm/trusted-firmware-m: Remove duplicate config in the cmake file.
Date: Tue, 24 Jun 2025 15:31:40 -0400
Message-Id: <175079350181.41239.8238440348245687522.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250617163011.2238429-1-yogesh.wani@arm.com>
References: <20250617163011.2238429-1-yogesh.wani@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 24 Jun 2025 19:31:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6582


On Tue, 17 Jun 2025 17:30:10 +0100, Yogesh Wani wrote:
> The PS_NUM_ASSET is duplicated in the cmake.config and the config_tfm_target.h file
> under corstone-1000. The commit removes the one from the cmake.config and keeps the
> one in the header file.
> 
> The whole rationale behind this is for the vendor to be able to override the
> configuration using the cmake file.
> 
> [...]

Applied, thanks!

[1/1] arm/trusted-firmware-m: Remove duplicate config in the cmake file.
      commit: d91c6d7148dd879da28d452966d418d7d6cfef89

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

