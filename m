Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96C05C433F5
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 03:10:45 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web08.7994.1642475444420965006
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 17 Jan 2022 19:10:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=63wxUSmK;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.49,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f49.google.com with SMTP id a8so20259503qvx.2
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 17 Jan 2022 19:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/KZZ3IrvCp89ga7AAZj7xfwqg3Kj6S1LH9A1Iv5Z5vQ=;
        b=63wxUSmKg/w2OoNsdDViEgkT5iSJMRmrORvej4PuZCohTQxgK/R5deyfj21PDdsuyK
         Z02AwPKtOur0Daa4PZY2plaAZ9ucpb07C3IPAwcdc1DrwOrAhQSGChspe6j+/gLGz35v
         c+dr3vEeGvyQ0Qrhu+bRva+oDrmnerjAqvkGL14gA5mrUXmR8OyzqycdfLtOX9HHxHau
         zucIjROm0Dx6rLKuAC/vqMKDrGOkS6LtOjR5sN4hOGBigftkBTxiFmnpdGkYWB7MOcoW
         aH4wy0dfZiio6RgMySLI+uk8LGfuTr79YDivHkSgBzKeRDi5256a0ahwV03qMAyhHuxp
         Smqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/KZZ3IrvCp89ga7AAZj7xfwqg3Kj6S1LH9A1Iv5Z5vQ=;
        b=riAXD3nB3V9hh32PCeCxn1GJDXN/LltuFjfp1jLnAKqDB0KWNp03dFEV8jvSWkuKhd
         VGuF4qVi6vGq0yAKVqeyl2NEew7fBUrBvZuwKYnnyf+kB1iFrHTBciKetXAN4oqRpwZE
         IoXXWEitMeYoExP2IPOMDNFJBE6DbjT0SzfOJyJP+3Bw8Cwafwy1CGocEO9ieZc86Up4
         wfYwQ1//qa80M7qG7nyyg9tsjuwdCf70EugLJE8Xyn+XgESZ0bETm2lxwh6dFHb9LEcc
         hWBWvmaw8Lfyjlm8ELTV6Py+QqhxJvzhAfqmM0at2A0TFlDicfPxzJMzGQiAwmz94Xwu
         j3Uw==
X-Gm-Message-State: AOAM530LN8Btf2wufoJaBtTpOnUItxUR7u+B5637OK3OaGUFmYN0nPYJ
	LdBFSa2Wn2myhV4jh5gUJpXsdex7wq39LA==
X-Google-Smtp-Source: 
 ABdhPJyIFQPEYxJf2bT0QWvInTHHh+xE3n2AuO8q9c2oa1CmKfLuutYGu2IpBS77CJXNadtvL0kD8g==
X-Received: by 2002:a05:6214:d88:: with SMTP id
 e8mr18850231qve.81.1642475443501;
        Mon, 17 Jan 2022 19:10:43 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:ff9b:992d:3671:5cb2])
        by smtp.gmail.com with ESMTPSA id
 m4sm10791351qtw.27.2022.01.17.19.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jan 2022 19:10:43 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	"vishnu.banavath@arm.com" <vishnu.banavath@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH honister 0/2] arm-bsp/tf-m: fix capsule instability
Date: Mon, 17 Jan 2022 22:10:35 -0500
Message-Id: <164247543503.1092825.14100101754226448552.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220117181405.28504-1-vishnu.banavath@arm.com>
References: <20220117181405.28504-1-vishnu.banavath@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 18 Jan 2022 03:10:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2851

On Mon, 17 Jan 2022 18:14:03 +0000, vishnu.banavath@arm.com wrote:
> This change is to upgrade TF-M to latest git hash which contains
> fix for capsule instability issue for corstone1000 platform.
> 
> Latest TF-M would also require v3.1 mbedtls. Also updated git hash
> for mbedtls repo.
> 
> Vishnu Banavath (2):
>   arm-bsp/tf-m: fix capsule instability issue for corstone1000
>   arm-bsp/uboot: fix null pointer exception for get_image_info
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/tf-m: fix capsule instability issue for corstone1000
      commit: c30d90a77d78279eb07549bdada011e960328c46
[2/2] arm-bsp/uboot: fix null pointer exception for get_image_info
      commit: e15df2738e41e22b653f0f55c3e76ffc076a98f9

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

