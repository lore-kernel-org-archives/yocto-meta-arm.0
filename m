Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34BF2C4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 19:04:52 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web10.1997.1667847889319246281
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Nov 2022 11:04:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=sHud4VdV;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.171, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f171.google.com with SMTP id z1so7760158qkl.9
        for <meta-arm@lists.yoctoproject.org>; Mon, 07 Nov 2022 11:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5nG95UVUFXoTZoUdTj/7/1ASt0yjJgdAcMI+0LbLqwQ=;
        b=sHud4VdVJoxW5Guo00U/EDxYezqmqp8ROw1U+RkvPt+G34pGvmb9F20H2dt1fZoAyB
         QUmG1kdiBijX7P0quqhs1isiw/cNMmwzCtRaWZ2LTgsOE7CgV+739qBZELZA5Kz3GO6l
         o10RSFcJMw2XzujaWRra0oCMxwojwB9EhQuHGUBINJB3fCRtbdKAUI4f9LDsnV/ffxSw
         aI2WqGx3/fRAgGQuXsQ5wQ17Bt39BaADgYxFLYat0fyw760CHsPVNCyHyjUg/hEqOc8k
         wAUXQaHNCwEzAA4PNHO6ok7hSnGA8lH9KomN3+88WJ0knVCfiSExai5vPq4//fMUWDMq
         lHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5nG95UVUFXoTZoUdTj/7/1ASt0yjJgdAcMI+0LbLqwQ=;
        b=F5Wbw6p6+1o1vgAePXfaPDd1Spgbr6OCONlluBc4POCbiO+QILKt3uWxcSo809zTbB
         Mokjd+1ZR+BgRImeC6DnDp3Lwzgs9Ipf2tBYxEsonP6LhISNVJ7BWI5fJ+TNOXmBZ9Bg
         KOqpsP7f499gAUHoIlHPZK9pS0SRAj3xm4Viezm5xNBqxDFLY8snmz4MknKYzPMJEivk
         jYCUUyeqZwoWFAFzYF5nn05ZZa0Sh9iCr9SNJk/GhobA09ldXnQgK5vvixpvylkUxQIJ
         U0XDpcKEGs9UYEeMLUk6a7gswY5uHZHD7pk7635laNc1VUFyoxp4Q/62z6JtUucwbMhh
         aolw==
X-Gm-Message-State: ACrzQf1c7yEqnt0UGestnKPiD9VEcvD2b4EwKTnXtbTAtPar6Z55nLfU
	RqLGFC38YM2qQWQtAHK4xQjDfEBz7cMxtQ==
X-Google-Smtp-Source: AMsMyM7aM1P2EHq7YKGfnLZTU/nl57E/HBAQr+loAkAkX2yDPLdW6jH1Ue+8Buyg3ZWfx0rT31js2g==
X-Received: by 2002:a05:620a:4544:b0:6e2:9feb:4520 with SMTP id u4-20020a05620a454400b006e29feb4520mr36738933qkp.543.1667847887953;
        Mon, 07 Nov 2022 11:04:47 -0800 (PST)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id de4-20020a05620a370400b006bb29d932e1sm2299624qkb.105.2022.11.07.11.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 11:04:47 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"emekcan.aras@arm.com" <emekcan.aras@arm.com>,
	Jon.Mason@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/2] arm-bsp/trusted-services:smm gateway fixes
Date: Mon,  7 Nov 2022 14:03:52 -0500
Message-Id: <166784783591.2324924.18267682679892215563.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107114148.48326-1-emekcan.aras@arm.com>
References: <20221107114148.48326-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 07 Nov 2022 19:04:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4111

On Mon, 7 Nov 2022 11:41:46 +0000, emekcan.aras@arm.com wrote:
> The SMM gateway in trusted-services does not return the right
> error values in negative cases. This patchset fixes those issues
> as expected in EDK2-test
> 
> Emekcan (2):
>   arm-bsp/trusted-services: add checks for null attributes in smm
>     gateway
>   arm-bsp/trusted-services: Fix GetNextVariable max_name_len in smm
>     gateway
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/trusted-services: add checks for null attributes in smm gateway
      commit: 5fd87e47f6d6ef4949123a2b21a6a4217b84ecc2
[2/2] arm-bsp/trusted-services: Fix GetNextVariable max_name_len in smm gateway
      commit: a41572a03284c13c31c612bc04eb6c34bdf9f03d

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

