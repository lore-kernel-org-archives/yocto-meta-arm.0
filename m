Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25999C7EE2F
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 02:11:56 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.127.1686190314535754887
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 07 Jun 2023 19:11:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=b3Im0R80;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.44, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6261616efd2so1219106d6.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 07 Jun 2023 19:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1686190313; x=1688782313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CcL/FRic6W9fGnsX20t9rgbPxSkq1SjcOSfngksMNkw=;
        b=b3Im0R80AmHLak5+8ZfDtWRi5QmRI9cKlm5XFJvgSbPBqXE3v6RB/Gl3de53CPQB7H
         KdGvUCKXLKgPbFim1358nKECcsrIPx2Q0f95tNuYjpuFplEtghk1Z9BR5ZKNCCxktfCK
         5kaYH1TGWwg6ud3420QsYkcE6hO9jBWXupJwfq91WjbhMu5iItUBGnsTwQnggoyOnwO/
         sGcaSimu49jZSWpYhTSNuyxi0b2GxGFtDLArYXNW836UMmEIXULDMJG6k8b90mVQ2FyI
         bzKF6pe3mDd1+7U7YKzB2wJ885+m3Iwz7T12BS/mdxGYeW0TRhbNrVcQU952E6uSd8G/
         87Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686190313; x=1688782313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CcL/FRic6W9fGnsX20t9rgbPxSkq1SjcOSfngksMNkw=;
        b=In81wfQTMAA8OPLhFC5BojrCL/ZAQf8XbCet6bh8QmvRRaR3LWO7gRQPkuG0zyDowX
         e4ezhB1xrpMHEidvi8DQHowIpOVTxRJFuaFSx34Gs2X087ONlzhYD5hp0ceoihsLXWAe
         iX4XtmGFIXBpG7Q9ftuHtJQhrNLSeV/hv926O2gG/TodnqQOH16grE3GsBcszSeSqD/x
         7dKWgrfr1pe5BSFnGgvqrIjeTJn5zPvAyq7lwDpH9IUR2+WAS0jRXNY98gPnzJgfFJ2F
         CMNwytk52+uCnOxNqA7JjOqg6oA4auqTyCmybj32kTNO2wm5Ul0Tt0wPGb4B684MOfsT
         4mzQ==
X-Gm-Message-State: AC+VfDz4hXDupx5HSKoftYMZjQ6B6XT/8pWgb9AN0thN5o141RBUjMPL
	nzVQjHg6Ib2MUVveQWZ9P2uSDz9Pjyszq5WtWx0=
X-Google-Smtp-Source: ACHHUZ6Lv6u6CRQWSuqsnv5ZmjpV9q8btCkLbCzPYhyXBfv4J+v5TaLlafsXtqz8WXCYpSji4k/h9Q==
X-Received: by 2002:a05:6214:260f:b0:626:38cc:6497 with SMTP id gu15-20020a056214260f00b0062638cc6497mr260518qvb.5.1686190313152;
        Wed, 07 Jun 2023 19:11:53 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id h9-20020a0cf209000000b00626a0ea44fbsm83592qvk.23.2023.06.07.19.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 19:11:52 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Gyorgy Szing <Gyorgy.Szing@arm.com>
Cc: Rui Miguel Silva <rui.silva@linaro.org>
Subject: Re: [PATCH 01/16] arm/trusted-services: update TS version
Date: Wed,  7 Jun 2023 15:33:15 -0400
Message-Id: <168616639800.3869142.18332937935326138265.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230519112400.340-1-Gyorgy.Szing@arm.com>
References: <20230519112400.340-1-Gyorgy.Szing@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 08 Jun 2023 02:11:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4747

On Fri, 19 May 2023 13:23:45 +0200, Gyorgy Szing wrote:
> This change updates to latest available version of Trusted Services.
> List of changes:
>   - adapt SP recipes to file structure changes and support for
>     "configurations". In TS each SP can be built in various different
>     setups to allow adapting to platform and integration specific
>     differences.
>   - MbedTLS dependency has been updated to v3.3.0.
>       - This needs new python dependencies are required in the build
>         environment.
>       - psa-acs was updated to a matching version.
>       - do_patch() has been updated to support the MbedTLS patch added
>         in TS.
>   - Update TS dependency patching method to use git instead of patch.
>   - Downgrade nanopb to match up-stream dependency version.

Applied, thanks!

[01/16] arm/trusted-services: update TS version
        commit: cad1cc154f795739ff9b5a32397ab6b4301f0093
[02/16] optee-os: remove v3.18 pin of OP-TEE on qemuarm64-secureboot
        commit: c5df0d9acddab09a3b05e075c85a349edcca7f92
[03/16] arm/oeqa: Make ts-service-test config match selected SPs
        commit: e0c451ffd2510c19bf52c4fdcfeea372e9990643
[04/16] optee-os: Add support for TOS_FW_CONFIG on qemu
        commit: b81642c5f8566a947a13ccb3ef135157b1842449
[05/16] arm/trusted-firmware-a: Add TOS_FW_CONFIG handling for quemu
        commit: 260b3357865ed9250c473a01aed40164e2301067
[06/16] optee-test: backport SWd ABI compatibility changes
        commit: 73d9318f0b157021a5d51f7cf435a3713a5ed594
[07/16] optee-os: enable SPMC test
        commit: cad5dd0f8f67f3db23dc5e71703f8188190122e0
[08/16] arm/oeqa: enable OP-TEE SPMC tests
        commit: a13b63f9ea04eb5500b706b0421cfed6e293d634
[09/16] arm-bsp/trusted-services:corstone1000: remove already merged patches
        commit: 6e0f3be575c6452f3810e0154d8c185801317bef
[10/16] trusted-services: update documentation
        commit: eaac633fa64a0bc87e9175461c6d073dd8b7b4ee
[11/16] arm/trusted-services: disable psa-iat on qemuarm64-secureboot
        commit: bcb0a72c93c60b89f1815b3c1921649323acb032
[12/16] arm-bsp/trusted-services: remove merged patches for corstone1000
        commit: c3cc9cfbf788c88a80209da1046af4a4d917e50b
[13/16] arm/trusted-services: fix nanopb build error
        commit: 1f2ab563d159a7150511234865fd54838e2672ea
[14/16] optee-os: unblock NWd interrupts
        commit: 78d9aafa2ab27dda70d524c614e2d86f08d5e29f
[15/16] arm-bps/corstone1000: setup trusted service proxy configuration
        commit: bd8d017051b9f160c6bb041650a24fa527a7045f
[16/16] CI: Platform specific Trusted Services config
        commit: c1a7dd5eda419109b179af6cbf93cb0dac2f7ae3

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

