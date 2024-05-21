Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B2C9C25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 14:20:45 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web10.20889.1716301244828543361
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 May 2024 07:20:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=j1fu4qVH;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.167.178, mailfrom: jdmason@kudzu.us)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3c99d0521cbso2413145b6e.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 21 May 2024 07:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1716301244; x=1716906044; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ycnT18Mqm/S2Tec3vZEGgtONQubj4sQMhkGfiJqwQck=;
        b=j1fu4qVHDOljupHeFzyZPjYuL0TGBp0JWenkCqmZyx8Gn9kVkgeTOBHNHFuY0ZeaSP
         oU53DYDR0vdUjgrarxoj+pvzTFDwUe8AEeFCwfqSn1xPegEwpoyStsZSt+/sZ9hZGSDq
         zUMZMS5XASKWyC0AQ8XhQMC9REYIhyjNkbEV7f8tgVr0qhyCXuqYPqdatAeLr5vx1S82
         lrLlYHVW2l0MUPkOlfeQ9u8mZ76RXpJmTNYBYmt4gumoofF2a0NBZcakOcZT5HXtiSjg
         1M8y4NkqKcN9WHpJCggqrj5jnJuC6in9lhIgVvUSg/yC9tKo2NCXHwMpFtJTXX3TxQ/k
         uRSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716301244; x=1716906044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ycnT18Mqm/S2Tec3vZEGgtONQubj4sQMhkGfiJqwQck=;
        b=mD3oETCugwQpZGzcbpIwZhsNkmi1r3hZFimVMm77lq/0DFSKuvV7S+aanfHcJBSV2c
         ouz5PZhpfdObOPplWB+FR4ef/Ot8gd5laedZE2gljmGImTETeBwV8go5YcH80V1cimaR
         2ow/3SEEGuJEQRddB00uMxygkA+BqfCEFyY/m8ev/tWFeZa9K43jJoQqG8lP5uhe8hu8
         1eDn99cuxvj3UKQ6NhsoP2PdCFhzO6GBRMsDB90xRLm6gl7TEHmvPzNSzS8OkcVMBqqh
         9b96PBLE8To3sp+F82oXH93Mu5yidH+gHqTBSlkZiX/j2golnF2VScafY/Lm3cdAc+XS
         Cilw==
X-Gm-Message-State: AOJu0Yw6QjvIRvidiVgT+9x57tcuSIWYt7pHYIH2mca5U/mlyUmCIhhI
	3Aco35eVDz8VEm3XTGJFGeoROFP026oy4M7toKoiwUvomT65XcvXLypzOoxuRlwFFOzoE/EvwNw
	=
X-Google-Smtp-Source: AGHT+IHsKJ05XiE8B/4avEYxJoQo3HjlzFyU5G76pRm6qtoUA6V1mU8c1c6duTw5dWM2UxLmFbG+7w==
X-Received: by 2002:a05:6808:4c4:b0:3c9:66f2:f31a with SMTP id 5614622812f47-3c99706e4acmr32408091b6e.34.1716301243826;
        Tue, 21 May 2024 07:20:43 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-794883e67fesm167848085a.4.2024.05.21.07.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 07:20:43 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	emekcan.aras@arm.com
Cc: Emekcan Aras <Emekcan.Aras@arm.com>
Subject: Re: [PATCH scarthgap 0/1] arm-bsp/trusted-firmware-a: corstone1000: fix reset sequence
Date: Tue, 21 May 2024 10:19:49 -0400
Message-Id: <171630119052.2318166.11476878743536553439.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240516140527.67665-1-emekcan.aras@arm.com>
References: <20240516140527.67665-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 21 May 2024 14:20:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5743


On Thu, 16 May 2024 15:05:26 +0100, emekcan.aras@arm.com wrote:
> From: Emekcan Aras <Emekcan.Aras@arm.com>
> 
> Corstone1000 does not properly clean the cache and disable gic interrupts
> before the reset. This causes a race condition especially in FVP after reset.
> This adds proper sequence before resetting the platform.
> 
> Emekcan Aras (1):
>   arm-bsp/trusted-firmware-a: corstone1000: fix reset sequence
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/trusted-firmware-a: corstone1000: fix reset sequence
      commit: 7bae90d708702934e2f507c7e6e4122cf91160cb

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

