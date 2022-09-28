Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4488CC6FA92
	for <webhook@archiver.kernel.org>; Wed, 28 Sep 2022 13:42:19 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web09.8013.1664372535324937248
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 28 Sep 2022 06:42:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=XTZ4le0d;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.179,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f179.google.com with SMTP id i3so7855347qkl.3
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 28 Sep 2022 06:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=1/Wr4WswfRucOx1XDF3AJ9LKaOEVXcCftjv2fy8/jjQ=;
        b=XTZ4le0dbJ3m2cwFU48Y8mMvzChtsk0wpsv+/rhwSb4+RsCfTQ9CWa3GiJAqHO3Dun
         IA1+DsCrlbjGxCOyE6jE4MJwOllC+Waxxg1GO3cK4jrBZLBhAZKG3Kkvfx4G/YAaZ0iY
         OSesdmqB84jde8B64xf0+jh2dvZOR2jea0H19NpoAD1kqcXe9NIwHYEqPorRdcgvrGok
         s218kWRjb4Dzd8RE+puXk5LZB6y/cjLth6fP3vSuLcNpyMRNoDM0k6ti7559QIxg5YRP
         JL+/fhhy4l69IYq9/nSVMLUEixc34P4NgWhVuyzZt9pGgNIZMs44Bv1VKMvd3fsBjroe
         1Y6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=1/Wr4WswfRucOx1XDF3AJ9LKaOEVXcCftjv2fy8/jjQ=;
        b=uaip4m/kqkAZVUlwTJd4+5G9IDaqCWK6l0HWjS6eClBc2DxCDVlPZnrxQLyX/556A2
         wGTkwmiUHMg60ClZP8JNZ7py5yhsvu/Yd0NMZurXLj8jad9nr4SelGmudvqdrkg6UUQm
         QI3f2eDMP45bjDQSYu6iLCFBsvFOJ9Ryp3EhemQZGQH7Fw+QetQY+g9ExF2JRUYpBgr/
         Zi9Eupg/hoANCP90R1QlN2Ec32YebNuWEEYdgT+6M5qhQutouXottkLlixZMCkGkLRrR
         G6BWcB2R3fGiBwo9fW3GKhs+/gdrviCvVNDO9Yk2z3QDrNZUNXePn9+uSsjzvnORrqfv
         O26A==
X-Gm-Message-State: ACrzQf0tyk66is1dsW9wZ50diR22bpcIEm6547u0Jf11SccfGNYRLZyN
	x0JKpt/c8iASq4s60pkilR7R69OCpTTPeA==
X-Google-Smtp-Source: 
 AMsMyM4F+dHa+vltw0v2+cYJgSjcOEyn1//6GjzkSVooxPQEfVEn58aqzLb58k4tit1M2DNb1HpZ1Q==
X-Received: by 2002:a05:620a:4042:b0:6ce:3fe4:4e35 with SMTP id
 i2-20020a05620a404200b006ce3fe44e35mr21463543qko.276.1664372534002;
        Wed, 28 Sep 2022 06:42:14 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 e11-20020ac8598b000000b0035d4b13363fsm3195153qte.48.2022.09.28.06.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 06:42:12 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm/hafnium: update to 2.7
Date: Wed, 28 Sep 2022 09:41:58 -0400
Message-Id: <166437252283.2315819.9641468670064229967.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220920223937.8081-1-jon.mason@arm.com>
References: <20220920223937.8081-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 28 Sep 2022 13:42:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3854

On Tue, 20 Sep 2022 18:39:37 -0400, Jon Mason wrote:
> Update the version, update the patches, and drop the ones no longer
> necessary.

Applied, thanks!

[1/1] arm/hafnium: update to 2.7
      commit: c6bf835cefedbd5baf9bedd96d8659c425224fd4

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

