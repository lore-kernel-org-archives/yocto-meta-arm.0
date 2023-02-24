Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70131C64ED8
	for <webhook@archiver.kernel.org>; Sat, 25 Feb 2023 02:21:44 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.36782.1677291698785719492
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 24 Feb 2023 18:21:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=mD+g9Uuq;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.49, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f49.google.com with SMTP id jo29so824760qvb.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 24 Feb 2023 18:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pznG5patYLHsSctdh4hIXiid1uW5fDlMmcfjm0RBNU4=;
        b=mD+g9UuqjLiTLbb8Ov6gAQLTVgts6uxv7VEMJOfLO5SsGoVIymekRKsnntvdyidt6o
         VcCeA6wFIIQ/U/ksGQ6o6u85lsgMaQLXxbGwmcAdiwint89TmfJ2udrEVpr9zPuufYzU
         HGtul3ZzqSKRGfzsWQJsJFT4SKUEMTaj0dFrjStaXW94tk7y8aRdkaT8ucNcuYqUq/WZ
         qEmurkqxfL8KZEPT8thnnOx1ASbvSdTL73e+660/iOuyVJQmcImRpRxUOscP/Vle28m5
         7NU87tS3P6bzPmMmyQ+1OZaIMYj2QQ4LoiI+YbuC5pY5cINYxRGzN6FySM7KQoID6pJP
         HUqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pznG5patYLHsSctdh4hIXiid1uW5fDlMmcfjm0RBNU4=;
        b=XAkhANZMhPxx2iTh0kblFdVY0NKieknkiClXxCBi4ofJu7a8iijfKX69gjk4JQcHFn
         a66LzoIfQAQifNCx7omrM//vo84Vo0iv95NHQxW677/VXJivL3OpuWMQZVRdCPv2X6LE
         7iBiW93L9mby+zUr4q18kq3Q5FWaml9zW6ukZEBr2pn6aQnnnOHKqSJCDWfwzQWQR+HA
         QRrOHGDuWCuVCZPtPQQzlLTnypO3d8GGdhxPcibgWdpTbfG4Mpx5YizoM2ODd8ZHb6c3
         MEHhDC4zQQAXjUTGqagrM63+yYn7j8JcAht/JQ7L20K3R+8VeJKXT0Y+9BN/en7TiOUl
         jAYg==
X-Gm-Message-State: AO0yUKULPD/IQ+itN+gwao+iN6PbbRYoC3Y5jDTDXlFcs38vShm8QxIa
	17QrQenBuKT2rEyPWxWQwJG/sH6abYG7La0x
X-Google-Smtp-Source: AK7set/fyhf6W+F/n0IsQvdY0X0lydrJw0nRFyYUX6THGv8fk+FuLbdKIKKEHZfT+qD1NF4W1bBNVw==
X-Received: by 2002:a05:6214:20e9:b0:56e:a756:919 with SMTP id 9-20020a05621420e900b0056ea7560919mr26889382qvk.47.1677291697384;
        Fri, 24 Feb 2023 18:21:37 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id f64-20020a37d243000000b0073ba46a585asm441874qkj.64.2023.02.24.18.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 18:21:36 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: Re: [PATCH] CI: Add BUILD_ENABLE_REGEX option to conditionally enable builds
Date: Fri, 24 Feb 2023 16:57:02 -0500
Message-Id: <167727582370.381956.16903175618882855579.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230224120606.1275117-1-peter.hoyes@arm.com>
References: <20230224120606.1275117-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 25 Feb 2023 02:21:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4454

On Fri, 24 Feb 2023 12:06:06 +0000, Peter Hoyes wrote:
> Mirrors of meta-arm may focus their development on a small subset of
> MACHINEs so provide the option to restrict the boards that are built on
> CI using the variable BUILD_ENABLE_REGEX. If set, it conditionally
> enables builds; if unset there is no change in behavior.
> 
> This variable could be overridden in a scheduled build, to e.g. build
> all the MACHINEs weekly.

Applied, thanks!

[1/1] CI: Add BUILD_ENABLE_REGEX option to conditionally enable builds
      commit: d5c024f1f5326fb19de33928acea34df4b58e9ba

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

