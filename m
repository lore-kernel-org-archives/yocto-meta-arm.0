Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 378E5C433FE
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 20:22:26 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web09.1968.1664569339215128342
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 30 Sep 2022 13:22:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=v48OTB+P;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.169,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f169.google.com with SMTP id u28so3522329qku.2
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 30 Sep 2022 13:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=vsczlYldUn6G4Rqt4IFZjv03u/C9rbhNT4CR1JOf5Gk=;
        b=v48OTB+P6D7gruLG6Sm2aVUt2z4ISiIqQMSa8labnKVClkL2UBluRYCiZJAiphKcmL
         LN/y4Gg09TELgO4EPrB2amWHy43awDDSjOqdtNJDKgxa0aCkUQh5jE8+9STK+cA4vMmR
         GTofuqNm7zP6oKljPjPr9WX5l/aar6DANkv3RAVHsn9xCXPnhuxrNgZ9bnBMSQ4g4oc6
         h59x0iAITpF+iYJRAHtEBlL6iri3j3Dc8Dac+VPuifT9/sNEz6p+Lz/uBYIf7y8VcOWl
         7w5VCDBaXejkVUtU2NNw9IYrJZxTUu7Gm0U/inHgVEGnNptcA+C2w08/QyOCBbNqXKj/
         1R/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=vsczlYldUn6G4Rqt4IFZjv03u/C9rbhNT4CR1JOf5Gk=;
        b=RZoo/k/fYT/LStdqUhmi16i77Pj/5Rcgopot1NBWyrvtVjxwuD8082kstanT9WWNqN
         GL4QTeM3/1I+G9lDpWNCTz8S1Km7IWm7fCGtMcAdGCnYpy8DvsxyH89ArwOcgrR55yzv
         BaNlW99927x1dNhQEcx+YDWzDAiACH/qaXDt6qgzU5petxSI4t5E3sBBJl96JvL8XYmx
         VvLGnJJLymKi0eOyo3thq3qjCsYgRbQHmtOsTghcnu1dQWZUgOVlA5Y+e0hhziJX2k3u
         DCzFzhSEpuaoe5VV/1gHi8Usg6n5cQsyDTqAq72CJE47l1msAIBfPcVz29Hb/ati6XUV
         ERbg==
X-Gm-Message-State: ACrzQf1j3+HSmiWHfY2jXvASK+0n0lvojt1l+A6V3TRdQIu/WWENbzTv
	lhFBVqrGJx78TicWkbPWBiWIEEAJswkga8LK
X-Google-Smtp-Source: 
 AMsMyM6So/ufA9IRRM6KIux/TBAMdUm+7pgnEviOZe6y0twv2hgLA8G01IRmKxBgK2VyyGTTjykOZw==
X-Received: by 2002:a05:620a:29cf:b0:6d3:2762:57e5 with SMTP id
 s15-20020a05620a29cf00b006d3276257e5mr839710qkp.389.1664569338009;
        Fri, 30 Sep 2022 13:22:18 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 i68-20020a37b847000000b006bb49cfe147sm3086133qkf.84.2022.09.30.13.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 13:22:16 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"emekcan.aras@arm.com" <emekcan.aras@arm.com>,
	Jon.Mason@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/2] Adding a test application for external system
Date: Fri, 30 Sep 2022 16:21:59 -0400
Message-Id: <166456932181.1898292.3597391811379869287.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220926121521.35674-1-emekcan.aras@arm.com>
References: <20220926121521.35674-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 30 Sep 2022 20:22:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3885

On Mon, 26 Sep 2022 13:15:19 +0100, emekcan.aras@arm.com wrote:
> Adds a linux userspace test application and a recipe to test
> external system in corstone1000 platform.
> 
> Emekcan (2):
>   arm-bsp/test: Adding a test app for external system
>   arm-bsp/images: Adding external system test to initramfs image
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/test: Adding a test app for external system
      commit: 037011da6490fd34e7a9f29c1eca3056ef5d904c
[2/2] arm-bsp/images: Adding external system test to initramfs image
      commit: 4a190f18def7355699fd5c4fc8657dead5b07e84

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

