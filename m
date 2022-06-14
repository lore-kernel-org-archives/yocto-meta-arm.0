Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 675A0C43334
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 20:06:56 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web09.1607.1655237210022051511
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Jun 2022 13:06:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=ERaldeJ/;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.175,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f175.google.com with SMTP id p63so7228598qkd.10
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Jun 2022 13:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nm0tVMJcnMARQ4noyFXMF4/aVRCT/WbQOh9gGca1JiI=;
        b=ERaldeJ/RuAMo+iWYrXbSU679jZbqeTHzqmFpkK8tuX11f8OOvH3hJ28N9M0h24gk/
         zo4MP6JJ7sAXW9gOtfy5tZ+aFIPEcmfREzpElQ9oFC4xSgnbfqzcKoORgcYNXiACSWBv
         S1PFYXug45X7FohnyXNpHjvoFzFnn4ZfY0f0udAKloxiUmQrfpsCfl3Kl60grhi35Hxs
         qf5EXXeYTlanhesXYWaQhLmRcbZuuzhq2blQzxbYzrxsip8mRF6+HPisdHHi5siinR90
         SRquUdSe2Oqg8UUP8yynpxBJMjcKQ4aosmkq4vUEg1ypWG8USzfERr5puMsANpRPsnyi
         dcRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nm0tVMJcnMARQ4noyFXMF4/aVRCT/WbQOh9gGca1JiI=;
        b=aSLYe+351Xink6YJB0qj7zcso4U7Wj/oeVFVRrMR3kGRX3YK9rD9T4rcX85KMNCMLQ
         Qum1IJEsIq6DoItLXrbBawygLayMyTmUW/hTwmnj4VqgINgp1FYex/KkrqKtBj1zC70J
         uTe9Gl9FRAMY5QFWcLqwQDQt0ByoVNxRFK1h7C+TiZeEGQGeGPqvkKe0U2UBkGIpBcX9
         caLctTqUAtPB4SjjYtZRfJyOChhOo/MzWQZsL15FjOoBMC3JzUfKUtX/LiaV7DGoD61W
         g6LsJL2EdZTZ9Jh/yBkwr6zVMs48HE0vz0V3NQe3+72uRWHUxb60+s5Xej9LaCo0FekV
         B/tg==
X-Gm-Message-State: AOAM533CgXB+zhhJoh4ZbMmfYjw39QHkDfjHlRW6uR67ME5GA0rkvyza
	56Z4jw6wrml4BAmNuUXC2BMGH/br8sIayw==
X-Google-Smtp-Source: 
 ABdhPJwMwRGtTeRlr/7OpioKwhBW/59ckg5nyGqQm5DOzsQoV98GOwq0W/crddRRYXy6GpBu0h4dTQ==
X-Received: by 2002:a37:a49:0:b0:6a6:a1ab:5f7d with SMTP id
 70-20020a370a49000000b006a6a1ab5f7dmr5355373qkk.15.1655237208900;
        Tue, 14 Jun 2022 13:06:48 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 d5-20020ac85ac5000000b00304ddab5fc9sm8020743qtd.95.2022.06.14.13.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 13:06:48 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"xueliang.zhong@arm.com" <xueliang.zhong@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/n1sdp: upgrade board-firmware version
Date: Tue, 14 Jun 2022 16:06:35 -0400
Message-Id: <165523719572.643054.1222297092133270006.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220606163422.8688-1-xueliang.zhong@arm.com>
References: <20220606163422.8688-1-xueliang.zhong@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Jun 2022 20:06:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3500

On Mon, 6 Jun 2022 16:34:21 +0000, xueliang.zhong@arm.com wrote:
> Upgraded N1SDP board-firmware to N1SDP-2021.10.12 version. This upgrade
> is to align with latest N1SDP release.
> 
> Xueliang Zhong (1):
>   arm-bsp/n1sdp: upgrade board-firmware version
> 
>  ..._2020.07.27.bb => n1sdp-board-firmware_2021.10.12.bb} | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>  rename meta-arm-bsp/recipes-bsp/images/{n1sdp-board-firmware_2020.07.27.bb => n1sdp-board-firmware_2021.10.12.bb} (65%)

Applied, thanks!

[1/1] arm-bsp/n1sdp: upgrade board-firmware version
      commit: ac2a323ab25062b2d916f0d51a5178b78b9d5277

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

