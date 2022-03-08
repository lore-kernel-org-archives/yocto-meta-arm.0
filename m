Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 686ECC433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 13:56:46 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.8173.1646747805464787158
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 05:56:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=VbyqVqcy;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.173,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f173.google.com with SMTP id h196so1179519qke.12
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 05:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=awCHK9mQCtVLpbVf9Aeal2lmWp5yAqX4j8t76oOnMDU=;
        b=VbyqVqcyudpa2h3qWc5DccLiowPaCuz8+flaXG/oZHITYI+KPG+BSYnOz7NcOHvk0l
         2TjnNKNfXeo4smvnANTiHdwIIYAkQKoG8648U6SAT+QSSDmzD0gg2O1JI4dUEN4VZXfA
         OE69XHqKZic8jpX+QxrQnLaIm9IypG9Qw8QGQnShSnlq3LC+kZSCiY2Vf8EEmcpEVBVW
         6ethe+T4D13lai0opqlOwrDUy3Yyilu47H6ngID7lpUs2RNs0zOgrPbAn5xctLsrXLBd
         vUl60QCJFNhqghWoxlJGOMz7zrUjpLdXXotjks/mEJBYd7OneMfL2vwK7fLzQsdMHFZv
         bdjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=awCHK9mQCtVLpbVf9Aeal2lmWp5yAqX4j8t76oOnMDU=;
        b=fbzMwchIkKXLfWY289RUlUCZvr8Yy88O0e0urEL8ZKNLyvk3P49HRTfUIrpI5szYcW
         JDU+JNWXCW8CVXzxYnXp+247Rct6G/OZw2w0eepl93r2jygYrPmXJSJ2CElzUIgfa/GS
         Noe+pD/ye5+PLZJZL5vYry1MH66d0v0kPUhYCE26T/dzsJ4Jsspkh5NlJCzfjNQ3fCTN
         ydAdil6h46ZYfmarRh3BS2oM/2XkShHRb5n8XUmPTE1vK1mPxANV1kkjHB35ifz1kQJi
         puquLN2V76XEumiYv7236Y9PwXnxijhbYnGlnlk1Y772GUj5dOSjTTfPVG5+zePzCuqz
         4nmw==
X-Gm-Message-State: AOAM531J9TLFicPwXYVdFt9G0NXZHdR23GfoxBZ02o/CbOUqkbJgOVX3
	4CBwlcn2SEkMdbUhcaaOSwHC1u5QPzxLSw==
X-Google-Smtp-Source: 
 ABdhPJw2hcZ+omnIBs1FCe0PklRrkt4ZyotLexvcMhlA92JYSffj2n6jx73uplRsM1RAMEw5sqQThw==
X-Received: by 2002:a05:620a:13a7:b0:648:aa98:b0bd with SMTP id
 m7-20020a05620a13a700b00648aa98b0bdmr10361572qki.660.1646747804338;
        Tue, 08 Mar 2022 05:56:44 -0800 (PST)
Received: from localhost ([2605:a601:a66c:b900:e36c:6a84:e7f7:3230])
        by smtp.gmail.com with ESMTPSA id
 x23-20020a05620a14b700b00648eb7f4ce5sm7356150qkj.35.2022.03.08.05.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 05:56:44 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"harry.moulton@arm.com" <harry.moulton@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm/fvp-corstone1000: update to latest version
Date: Tue,  8 Mar 2022 08:56:35 -0500
Message-Id: <164674779771.2128532.3080394624755396579.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304151134.21729-1-harry.moulton@arm.com>
References: <20220304151134.21729-1-harry.moulton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 08 Mar 2022 13:56:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3129

On Fri, 4 Mar 2022 15:11:33 +0000, harry.moulton@arm.com wrote:
> This patch is to update the Corstone1000 FVP from version 11.16.21 to 11.17.23,
> update the SHA256, update the license and set the correct FVP_ARCH.
> 
> Harry Moulton (1):
>   arm/fvp-corstone1000: update to latest version
> 
>  meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)

Applied, thanks!

[1/1] arm/fvp-corstone1000: update to latest version
      commit: f397564a054922d6fc28add1ddb59325c744654e

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

