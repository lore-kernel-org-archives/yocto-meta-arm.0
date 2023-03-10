Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54739C6FD19
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 23:58:22 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.35201.1678492699839608712
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 10 Mar 2023 15:58:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=D6FoXgHa;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.171, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f171.google.com with SMTP id d7so7599559qtr.12
        for <meta-arm@lists.yoctoproject.org>; Fri, 10 Mar 2023 15:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112; t=1678492698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vpgb7xCO+ABPJf6/iJmzMiOx3B5nA45BjU4w4ky6Rb0=;
        b=D6FoXgHaXdcBb6sCr9EbVb705ixGKERx/f01LkeoPbn/9hYacsY2YmYe3BUrwoiAji
         1iZ63u67ok5X3Gdh41PSHtrbFDSXefQht+ufzt+2IzNJkpe/xYs5f7Z48lixrwU9mBLd
         6cCOA0uEgxtJMfmUOguBDu1K0uugUcgeUGtuZ3RBDe0vR1h86mAPlFxmhWM3hfwaxzZo
         PUWk5D1qqCGoxTyOwr4L+bwWCRMpIGliaRsc8mSrtNz94VksVl+uthRkajsgm5LvC5ym
         67fQLaJhxILD28nszjtVJBHfKZCmiiiaBkNkw4T8JcLaby5cR7eTi6GaE82vjlU2rWS3
         m0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678492698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vpgb7xCO+ABPJf6/iJmzMiOx3B5nA45BjU4w4ky6Rb0=;
        b=4gtk3Noe8QyFlkc6RJltgLhxN8Z24X7JLEIUjLtmZZ3aRuChCN6uhUFacgMwgS9Akx
         mZ2i7lGP8SeVCwWyb7CU4AZmKMKOlRwnq0L/X4RmiyloSJwTv3W8+7nvuwvbP5opS91U
         M7nOIL4JKDXXvmx/7mQHVev9ebiY9T+YlXlCn1yG/SkYOkBPfLQWpL3HJbuK9PvkczBx
         odmW36J7stcoe0Lv+seFM8UT4OxudrlFgfyJQZj250Rd4De6LDZKaPdRzEi/Aa14oZPT
         k6dzxFnR/D3u03JFv9s1vNZeeZBGp7uVJD2p7dzz3iWY+wKdgpSG0DrLR7pNoEGn4tf2
         SBTw==
X-Gm-Message-State: AO0yUKVoHlhDlbafDLZ4VQOxy+7A+1qFWt6LXS4ZmHbnRfv2YuIdWDWF
	WsCul9CwGseHrY5zXbSIaZmkM59WnPwxAJqbbGc=
X-Google-Smtp-Source: AK7set+46Aop7DKwh/d9in9r5b/wJdpVbRsL0ZM29LwxeYTjHT9fzfjY+7+WdKvE9tWfp3ES7QPG1Q==
X-Received: by 2002:a05:622a:1706:b0:3c0:3be7:8ca2 with SMTP id h6-20020a05622a170600b003c03be78ca2mr26685578qtk.19.1678492698537;
        Fri, 10 Mar 2023 15:58:18 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id q19-20020a37f713000000b00743838d9f49sm490450qkj.12.2023.03.10.15.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 15:58:17 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/3] arm-bsp/optee: remove unused recipes
Date: Fri, 10 Mar 2023 18:55:25 -0500
Message-Id: <167849252560.923732.5309118847508634070.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230309211521.496531-1-jon.mason@arm.com>
References: <20230309211521.496531-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 10 Mar 2023 23:58:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4486

On Thu, 9 Mar 2023 16:15:19 -0500, Jon Mason wrote:
> 


Applied, thanks!

[1/3] arm-bsp/optee: remove unused recipes
      commit: 8b581f3de3d87bd5868f3e8aee65fa0a51282f28
[2/3] arm/optee: optee-os include cleanup
      commit: fa5fffd287ae3fa9aef5d95512ec76319fbcde62
[3/3] arm/optee-os: update to 3.20.0
      commit: dcc81b56ffddee9736d9b97bc4786e4fa8b69dfa

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

