Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50A23C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 16:17:41 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.712.1645460259919086944
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 08:17:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=4xVTmaLl;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.169,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f169.google.com with SMTP id z66so11597686qke.10
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 08:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dlACnh5gAGoqkbWiPmbJ06GOmhoQvwE8LMkhzjGtsvQ=;
        b=4xVTmaLlH/HkaNnfcqFYx6Anz16dMiss2uUIpK9pWwsXVeAtWcNVc59tuFWFhE3lTh
         YxX1odSRIoh9FTya6jkVlwostoXfgNwdhL3Cm3qjpudjtwGzxO2BgHe5vuAMTPYvuc1N
         wBYbLgskCLAjEh/0zaF1EUtlnR2Dxneh5D/T8liLDAqpayeicAtYzWnni6WvZAeoUSgX
         HoxQzx/xn1BKqppm9yGoCVX7oOwUj8rAcs7ROrAccg6tMvC1zSwWotgsM7yqpbVv20MJ
         O0lmBU5oC7JB5vonzcWhzxLZsIJDSA/RasUcbQceaHW3VligXQuNlSCJCTUcPzeXf80y
         C/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dlACnh5gAGoqkbWiPmbJ06GOmhoQvwE8LMkhzjGtsvQ=;
        b=P9sYBdcST0bIMhEk7sBT7Cq9kRzACjs53M6vx5o0u14fIKNiZBO+Pmn3JGU0NeIi3G
         m+CH8GI1qPvDNbvC9dcxjx+zftIEK8zuUgj3/bXVuA5/i3Wuk6tn3eXOum1Lqznzi1pk
         TExZfe3adOufe3tALOJmSJerMZcXLxZcCr9qLE8QSA07I/nHWWeVm82xWV/t/3xbYXET
         kUry6BH8XtF4EyRdyvuARZbyH+5FBFXGzYhsuALS7MeEC24lP1Ww0B9yDkWk9Jo/eBcr
         2UrYPdnOBN1I2R+Hspkixap87ANU/r0U4diO9tl9GoNbTJecODCGAgMQeJ1dz5KA0WR3
         9Ejg==
X-Gm-Message-State: AOAM531SXeUMWhUMFChigGx9Spgv1/3IKzjzIjlU0BUx7lj0x2knpV4Y
	qZ8W98WIgWhhJxDRvE/+fOpDwpWOUREaBw==
X-Google-Smtp-Source: 
 ABdhPJz6rsDw3Q2nRuPQaxjqktY6IzCUY0CMq/E5lULob966b5TVR1NFOts6Nr/7hB06z/szQ9Fglg==
X-Received: by 2002:a37:f719:0:b0:648:cd93:3198 with SMTP id
 q25-20020a37f719000000b00648cd933198mr4222096qkj.179.1645460258961;
        Mon, 21 Feb 2022 08:17:38 -0800 (PST)
Received: from localhost ([2605:a601:a665:9200:d6b9:d916:b7bb:1a0a])
        by smtp.gmail.com with ESMTPSA id
 84sm8005637qkj.44.2022.02.21.08.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 08:17:38 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"emekcan.aras@arm.com" <emekcan.aras@arm.com>
Cc: Emekcan Aras <Emekcan.Aras@arm.com>,
	nd@arm.com
Subject: Re: [PATCH honister 0/3] arm-bsp/security: drop psa-arch-tests recipe
Date: Mon, 21 Feb 2022 11:16:49 -0500
Message-Id: <164546020926.3944697.4078664049675553846.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220217155953.2569183-1-emekcan.aras@arm.com>
References: <20220217155953.2569183-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 21 Feb 2022 16:17:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3030

On Thu, 17 Feb 2022 15:59:50 +0000, emekcan.aras@arm.com wrote:
> This change is to build and install psa-arch-tests using trusted-services code and drop psa-arch-tests recipe.
> 
> Signed-off-by: Vishnu Banavath vishnu.banavath@arm.com
> 
> Emekcan Aras (1):
>   kas/corstone1000-base: update meta-arm-image SHA
> 
> [...]

Applied, thanks!

[1/3] arm-bsp/security: drop psa-arch-tests recipe
      commit: 2e388235cb96bce4a42f63f266ab6a7ed04b8752
[2/3] arm-bsp/security: trusted-services to fix psa-arch-tests
      commit: 400bd5d5f4e8441878020fe51f3eaa78831b578e
[3/3] kas/corstone1000-base: update meta-arm-image SHA
      commit: 43e5b037e860e450ff4904c325452e5cbf79c13f

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

