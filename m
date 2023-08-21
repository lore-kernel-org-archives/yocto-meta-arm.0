Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10D8BEE49A0
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 22:05:45 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web11.3912.1692655544012563574
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Aug 2023 15:05:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=m3gka7Nu;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.167.170, mailfrom: jdmason@kudzu.us)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3a412653335so2890037b6e.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 21 Aug 2023 15:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1692655543; x=1693260343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l/ixpjtgv5bu/yhvNB5ibiIGOb/6JW09ezTo8ohcpus=;
        b=m3gka7Nu/Zix5WbbjEVkKmrByj7GRaET766emdl7EoTxQZzLpYZt8BvOEEGYuacjz4
         6hyZfXVYszyvGih1TLQDBFkELE0TW9VIOkuxlY8mIo5mb1QryxwWNfSo7BDnQWjayo80
         tRdGazcpC4+MKZPfBpfCEH8eue5ClO+jychgTKS9lF4IdCiUBPUDzUjMtfKOF0ViF3/0
         CePtkr2s9eQKxXh5FQGwuJd9S0Ym9qb9uQqJawBePBh0bzqCGh4GdMZ1U72sC0z9ZvWJ
         lgnFurpXn+hj1yar5Wno5GyvVQwaycLKT9b56dfAJ14S5xrAvfOzJXAXOTqxD+ejM+IQ
         ad+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692655543; x=1693260343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/ixpjtgv5bu/yhvNB5ibiIGOb/6JW09ezTo8ohcpus=;
        b=jmEgKChwL8QyHr0D101MesRo8WNpxZVHE9xFQpzcjOXUlgc9GhSBl/Xjqstip4sDjJ
         XeVA+rzYUaeADCrDsQ6yHt7pQMf/KoTUz/d5K4GDZvBofeXnCqi6W1Uk5Ca4+d+R5Jgm
         IfWA25cgd47aJru/HzvJBP9WHCvB/6Oi8Y/PwrXvIMujw+xMpiw58R7dJZ6HeHQ91DbI
         cHWbCkPpG+LGXCHi7DHbxyFWfp+CXrYyHmWCggCMB6y90vD9nKRRFvRu9oQA4ziEDa+6
         1bVJcAyNZvyzwxbLNNH7UXvl93T4wRrNjx5/dIIuIeyyrTmxdsn+LdZVUI7nt+OXHh6F
         DZmw==
X-Gm-Message-State: AOJu0Yzco/qsHTR19tdUWuXpyfznLNnMUSejNEeZcWONjzK7ajItcOeu
	qSo7Xf6BlrLtPSSP2vRH5fdxO1e7vuZCfy8B02w=
X-Google-Smtp-Source: AGHT+IE3LHwtpZ025NurjFs+aUkTnj/Y7lFBbK1fEMqINBRxnyia9IUuja5lFGbBX0JwrcmJR+C8QA==
X-Received: by 2002:aca:d1a:0:b0:3a7:2d4c:5d4e with SMTP id 26-20020aca0d1a000000b003a72d4c5d4emr8545903oin.7.1692655542873;
        Mon, 21 Aug 2023 15:05:42 -0700 (PDT)
Received: from localhost ([2605:a601:a68d:9800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id x2-20020a0cda02000000b0064f4ac061b0sm404389qvj.12.2023.08.21.15.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 15:05:42 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Mariam Elshakfy <mariam.elshakfy@arm.com>
Subject: Re: [PATCH 0/1] arm-bsp/trusted-firmware-a: Update TF-A version for N1SDP
Date: Mon, 21 Aug 2023 18:04:36 -0400
Message-Id: <169265547666.3638829.1389124072991458489.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230821130132.840-1-mariam.elshakfy@arm.com>
References: <20230821130132.840-1-mariam.elshakfy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 21 Aug 2023 22:05:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4986


On Mon, 21 Aug 2023 14:01:30 +0100, Mariam Elshakfy wrote:
> Update TF-A version for N1SDP to align with
> Arm Reference Solutions' N1SDP-2023.06.22
> manifest
> 
> Mariam Elshakfy (1):
>   arm-bsp/trusted-firmware-a: Update TF-A version for N1SDP
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/trusted-firmware-a: Update TF-A version for N1SDP
      commit: 881b4aebe56b0591f6b93fe399080c5b8a9d3a67

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

