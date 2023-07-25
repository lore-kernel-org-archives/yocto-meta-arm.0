Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EB35C001DE
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 13:07:34 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.19838.1690290450332956413
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 25 Jul 2023 06:07:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=Mz7Frv1c;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.45, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-63cef62a944so20535306d6.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 25 Jul 2023 06:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1690290449; x=1690895249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eu9vaIn+7ui5C0tL5bLQKLnTk3DVSMeIzEdVRmGODZY=;
        b=Mz7Frv1cY3g0m5djoRBFj9sqW2c9gFEYfyfgOVY9eWU8xrC7f5OE6z9QK1o0scuHkC
         6NcGuiAyqsjJPUqUqY9mp2D1xN2wYxbjabmOUDcnpTfFyZ/+YzSfFW7y+plPjaqng/ko
         5AyVjlUn6f91p//eYE67l6EkhSyj2gBa1ui67aI8+t6FQQ+P+Aud5wlLNsbox7dWQXJC
         4tgCwWEDti9O5dZrKWRE7InbeUfiWW7M4gX5psEyA+LcpgOIwLv3UF8GsmbuRTS6NNc2
         TX4RkxmMO+yQQlnYSGivqSTk3aJTKmr6Q0p0PzBGdQheh0tdR+lYypnSEAHvQUJfPZQb
         p9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690290449; x=1690895249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eu9vaIn+7ui5C0tL5bLQKLnTk3DVSMeIzEdVRmGODZY=;
        b=Y6UAUm1J7+LutcgY+Ok0IjeIBU3+E6YDebYtP9ErRRKzAWNEFlo0kqZrb4CE6Gumwf
         xHi+kciM+Oul68Vdm7Ff1ueKyGvueVaQcBONQtTVEMr1OIHFSCAMlhOGyVHPl5nkfIy0
         GIY6dUUVw0cw7o5boXoHyPmmGvdTCVNxytWkmJSa06om1KO+z5JnHQDtHgJEFpOYMTOM
         djAo5Q0DkWKGQwj4pS7vZ5tUhkG7tkB2M95Wx+2JQ2wITrggy+9/vYhKWEE+ifB5KVBm
         cvB/3FBc2Aq8NyRIpWKINNIqjzajWNseutxmYRSIegsfwk9TLr/dIciLGkqBnhIBSnA8
         zufQ==
X-Gm-Message-State: ABy/qLbiDkoYn+SYtPZNJeMe7va4Blozo9qxjvNXSCQOuqZurxyURiIU
	sXHsoEPmrLSr/VQ0J0f+oHa5xKl2uSSOH/4AbHQ=
X-Google-Smtp-Source: APBJJlFexeoy/S71lKTqNHbCwSQIKFFyT1+tjwJwufKMcV7Sg5Ts6CyGCMO/Xt8HlOkTEKRmYoQwsg==
X-Received: by 2002:ad4:4431:0:b0:63d:e49:e693 with SMTP id e17-20020ad44431000000b0063d0e49e693mr2576658qvt.59.1690290448921;
        Tue, 25 Jul 2023 06:07:28 -0700 (PDT)
Received: from localhost ([2605:a601:a68d:9800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id u12-20020a0cb40c000000b0061a68b5a8c4sm4366160qve.134.2023.07.25.06.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 06:07:28 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	abdellatif.elkhlifi@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/2] corstone1000: u-boot: upgrade to v2023.07
Date: Tue, 25 Jul 2023 08:52:07 -0400
Message-Id: <169028952899.2433983.10334927573929544723.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230721104315.73907-1-abdellatif.elkhlifi@arm.com>
References: <20230721104315.73907-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 25 Jul 2023 13:07:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4918


On Fri, 21 Jul 2023 11:43:13 +0100, abdellatif.elkhlifi@arm.com wrote:
> From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> 
> Changes made:
> 
> - Porting out-of-tree U-Boot patches to v2023.07
> - Upgrading U-Boot FF-A support to the latest version of the FF-A patchset
> - Adding a workaround in TF-A due to an issue in U-Boot's PSCI driver (Fix in progress)
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/trusted-firmware-a: corstone1000: psci: SMCCC_ARCH_FEATURES discovery through PSCI_FEATURES
      commit: ddae9c437072c9ee5f28b4c5b6f2325d4995ff10
[2/2] arm-bsp/u-boot: corstone1000: upgrade to v2023.07
      commit: 79afe6a41ed01e477a8790322ec0c946f4e2ca07

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

