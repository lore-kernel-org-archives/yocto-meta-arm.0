Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6940E7718B
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 05:45:41 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.8734.1734932735811626369
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 22 Dec 2024 21:45:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=x4gs0UAg;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.52, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6d8e8cb8605so19973336d6.0
        for <meta-arm@lists.yoctoproject.org>; Sun, 22 Dec 2024 21:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1734932734; x=1735537534; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f7mNBpX/CAZCz0gfBQqqzjQ0TmS/Dl5sJ9t/sB/BPOQ=;
        b=x4gs0UAggC/irjcmzfW98XyeKccu/MOr4z2TYc5wOwHSYNPhLtjaEoVHi+6j3W/R0W
         FVa+GaB2/V30/9IUjD4+lC0SiSrfWHYFl3ttIgX6Wt1SUDjLnzO0JyKs/wRNC8+oysf6
         QWLRaMdHHiwjMIwacGN3yd4Poz0/vlAtRtdGp9lzB99kJESCsgxgiRRsDnaD7EcGcH97
         BG3g7+DWTn1d4X3UeAIbrk1l2HYiJdNWcQUw3Nwqe0cC8QfyKf8Rn9KiVlg0viGSQSHf
         YHvKZHAkxV+BNS75HUVEIk1lG6bK7g6pUFZep7jB/H7fluBzvnEiBABE2u3zHxEW3mC7
         2snQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734932735; x=1735537535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f7mNBpX/CAZCz0gfBQqqzjQ0TmS/Dl5sJ9t/sB/BPOQ=;
        b=Jjb09VnZ+c9+bUPLkepR8jGxyGLWgXlC0w2/YJUgnJqMcEq1/MDrTDNPbDbCPeU7xB
         SaPeS1r8XTfuNWr0tOex52TaJ3O+2oc2NshbOfq7y2aS+jBEfTFuTKsAG2ro3/9OBzE4
         b28HPIAT0XCz2D9FZzNM3CtzTJ3hWlc19B6ORIv1OFAG/R4rYkVVBrF8VO4smvhxbt1x
         9WCPlmzzIi9+XgYV5EzyPtZHB2uWwBgcKXRLJBAJIW/D2q+Jrgm80UChmVJX8Ul/knrf
         yG98cztlFnGiAU0IjWHGqJmBrEM3cgVGar++OxQ0amCwBdqmQzxYT4NNoGgl+xpD4a+e
         qfaA==
X-Gm-Message-State: AOJu0Yzxfx3GKfTBANSy8C5KsYwVz3dV3bmMRFLge60mSCX2w3PS83F1
	Ii8ARRarPvMFWpGtXcdDIZQPrzWcYEtkfH4Gk4GoO2xTAbxvyV+OwP+QZ/Go1vgN4AFt5T+EXDk
	=
X-Gm-Gg: ASbGncveVzEY5gyOc2VQCM3461VpvEe7CmVVbr2fWW0WkZOocZDrNhqpzwvTPH4FduE
	pu2q++d2t6ewz62vrB4YJD2dh4tybrTC8JiJWqO+20MTzuM/VNbtYqav4R+ezWbYvWc6scSyJ0i
	g8nMS2/vSqn1ZfXDyoV2iOqAw4TfLEC/N7RYOgK8bA50K6BKKiwsRVALxGeL6peVbTqPU0jftb6
	3ItriFr0psiUy77LOLBGQZEn/A4835somV4ej9TnblttXPU
X-Google-Smtp-Source: AGHT+IEzbhV0gluCgxyoMR1YwZz6GulEq3bvEoHrji9/uvZWIah8GfIHNWGBS+Lwy7PjXJIs6TPRKg==
X-Received: by 2002:ad4:5ae9:0:b0:6cb:ef8d:b10 with SMTP id 6a1803df08f44-6dd2339fb2cmr231377746d6.39.1734932734604;
        Sun, 22 Dec 2024 21:45:34 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd1813900bsm40933216d6.67.2024.12.22.21.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 21:45:33 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: Re: [PATCH] arm-bsp/documentation: corstone1000: Show flyout menu in sidebar
Date: Mon, 23 Dec 2024 00:45:29 -0500
Message-Id: <173493273019.1347092.16638054765349426448.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241218160230.3807251-1-hugues.kambampiana@arm.com>
References: <20241218160230.3807251-1-hugues.kambampiana@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 23 Dec 2024 05:45:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6300


On Wed, 18 Dec 2024 16:02:30 +0000, Hugues KAMBA MPIANA wrote:
> Use flyout menu enabled via the `flyout_display`
> parameter to show the flyout in the bottom of the sidebar.
> 
> The default Read the Docs (RtD) flyout needs to be disabled in order
> to not have 2 flyouts showing. It is done by disabling it in the
> RtD project settings.
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/documentation: corstone1000: Show flyout menu in sidebar
      commit: cc4399ad9a12061e2c74d2dde340b616fbc8687e

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

