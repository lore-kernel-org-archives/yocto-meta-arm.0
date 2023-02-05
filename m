Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B09FFC636D3
	for <webhook@archiver.kernel.org>; Sun,  5 Feb 2023 10:00:36 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.25974.1675591226536470584
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 05 Feb 2023 02:00:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=MmM3etrN;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.174, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f174.google.com with SMTP id 5so78806qtp.9
        for <meta-arm@lists.yoctoproject.org>; Sun, 05 Feb 2023 02:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aO8YHsalukb0kJyCSrCTp1N/GUb0dhog7BGnFKV53EY=;
        b=MmM3etrN6lhsJQwvKKQOb4lVZ1xQadk9Al7NIW970pCY5g+87aNWUMrz1G+vv3G438
         1f3HWb0nXWcpfuwE7mypnUPn0jFdX84gXPtatEovE7zs1YKfShR92H6xWVBKHGGcEjb9
         Tf1aXZGYqMMgieO6uWT4hAgRBApf4vR6E20AYfr4FhRsgOn0CaWxMUcdKXOkVQZP/LYs
         01yPQPQNzQLTlP3HWwK4uChcjMZjYM9UPbZf7s7oO1q+8IqQCeP1P4/XzTiF95jLXl6j
         egTTwB94sJtCuU1h1HOTuiZZEC6ZoF0LCfNqSjgIgORUaKlJbjrTbODEJF5qjhgqeI+W
         pUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aO8YHsalukb0kJyCSrCTp1N/GUb0dhog7BGnFKV53EY=;
        b=PWgxVvHGiXy9qSvucCceVnql3WhNLI0ZRuLOfnMOnNhqQlgFurN/s6l5TGIG9271eT
         70zlsGX5Z2OAnrpE9cHqCspSkWN/zfFplohVK0NQet5B80kxt6sVTaOdC0aIuKxXOOFd
         um4F84hwc7KJ9m5n3Axk5FHfo8gYYgFF1YJqvMwgWrtEWLklsQ5Lw3XXTHtp+tLnhFiL
         U2R3X+w49OUnADtAq1Q3t+egnUbQ/NqTY2DSFLVeAVc3AvWhfR38UtcxB8KsMiIJIFIN
         MECpCTbjZslCIpHZalQGdLuy3nYRMsbsLoZzE5kKhsANgApnlOB8gFRXFRmrYwD4UOsC
         WXsA==
X-Gm-Message-State: AO0yUKVC7ZyCQbu+GVUpYw/QJreyoi9KfDAZoBlSyAE7tLAugBtumj3v
	RmyJBYDfC1LZG9DnrzAMjcRz6oLaCXYyTslx4Y8=
X-Google-Smtp-Source: AK7set/l4r27naCGg87BCEh3Pm9H2w4UNrG9errXYASWnh37noiLIJF5oPbRHEWcEaDl8yNCghSTmw==
X-Received: by 2002:a05:622a:1015:b0:3a8:20fd:7111 with SMTP id d21-20020a05622a101500b003a820fd7111mr30373527qte.39.1675591225156;
        Sun, 05 Feb 2023 02:00:25 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id b19-20020a05620a271300b0071a291f0a4asm5400899qkp.27.2023.02.05.02.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Feb 2023 02:00:24 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm/linux-yocto: avoid kernel defconfig warning
Date: Sun,  5 Feb 2023 05:00:16 -0500
Message-Id: <167559121905.1756899.10206713844399414665.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230202142850.795987-1-jon.mason@arm.com>
References: <20230202142850.795987-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 05 Feb 2023 10:00:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4362

On Thu, 2 Feb 2023 09:28:50 -0500, Jon Mason wrote:
> 2 symbols were added to the arm64 kernel defconfig without the
> corresponding code.  Remove these unnecessary pieces to avoid the
> warning.

Applied, thanks!

[1/1] arm/linux-yocto: avoid kernel defconfig warning
      commit: dc10b73cc54fccbe781992b5b1eaf61cffbe07e6

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

