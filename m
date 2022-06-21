Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A72DFC43334
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 14:01:14 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web08.43820.1655820069600497113
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 Jun 2022 07:01:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=FhdewLqF;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.41,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f41.google.com with SMTP id 89so20501497qvc.0
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 Jun 2022 07:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=DHxaJ8/4YuiwhZ+ldScyV+8hTpePpDBL03QaZ/CRVeU=;
        b=FhdewLqFvhppQh77RWuwSTv4fW26AesUrYU02IS1TX5cirJYRrGN4xJT8QRU8Y7zuR
         vqcRVgU4wh2pCCclrp3bTujdaZXXiaFtGr9NCIUm+HdQix9c4BGF/UIxzDfz8qk+WvE3
         QJSKbPia57TW1GN3YT4RQwFt3GjOZ2MUvEpDBTOIcK9eSdHjELkQrxccR5gbJD9iv+MC
         F+hm2MF30FSQiNihNkAhAZJuCGLocyIVS1EfYTfgG5Rv0e2KKHHyB243IaG6D8286Uu/
         6oaygn1TbCHsNw6Oc7hpVQ/o0xUto7N/pRzO6oU1MoaoNu+JRhQN0VkUXA7/C3HjkEG/
         0ZWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DHxaJ8/4YuiwhZ+ldScyV+8hTpePpDBL03QaZ/CRVeU=;
        b=tERblJARU115PFGlLP1NUUXDUiJq3nWPIJKj9/UMsaFefuA6T1RQcw6e2lo8FJjpPh
         oTTeVxp7PKpbbR6bSlBawKPK1TiqH32nCymJt9QoAu+jeh/iIPa+Z90pAQeIaiNOFpyX
         eS+C0Gt69YS1x2OWMK9B44/Edh06EHIgeAqFbBgQryzABExS3b1qvNZ5L4pX8rFP4Q6d
         rwVKtN3qU0roMZv9Kn+6A4Iadwg3FPiZEWTsRB5y971UrpdLoZ7ro74p7w2ZxK/ZF8vp
         +icmlFpMLSE18/JEOFihbMrcX0OXq3o/vqGnEcmpnRIZTN46XUmWxJ04hcDz04/CNbp5
         6qLg==
X-Gm-Message-State: AJIora+CP3YUTUhsgOyV8I0R0kND6+Nl3ogAUHBG7BFdyDqYIcc2TEYk
	RKB8hWYnidLSy1dXq6QMJ76rbY4XMbJKKtHD
X-Google-Smtp-Source: 
 AGRyM1uIziyLJNoVVV1DRQKySUOVQr6Em/6VERtXGQaAsax1UGw2txRN4B55xcw4ADt2iQQuATjbHA==
X-Received: by 2002:a05:622a:514:b0:305:21a3:fe12 with SMTP id
 l20-20020a05622a051400b0030521a3fe12mr24493220qtx.107.1655820068083;
        Tue, 21 Jun 2022 07:01:08 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 p6-20020a37bf06000000b006a6a4b43c01sm13491727qkf.38.2022.06.21.07.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 07:01:07 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Rupinderjit Singh <rupinderjit.singh@arm.com>
Subject: Re: [PATCH] arm-bsp/scp-firmware: Migrate SCP firmware recipes from
 Makefile to Cmake
Date: Tue, 21 Jun 2022 08:19:22 -0400
Message-Id: <165581396225.2802669.8103307380349269033.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220620155931.913715-1-rupinderjit.singh@arm.com>
References: <20220620155931.913715-1-rupinderjit.singh@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 21 Jun 2022 14:01:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3521

On Mon, 20 Jun 2022 16:59:31 +0100, Rupinderjit Singh wrote:
> 


Applied, thanks!

[1/1] arm-bsp/scp-firmware: Migrate SCP firmware recipes from Makefile to Cmake
      commit: 5cb7b14e03db6567ecccb9462e8b3e35847809f3

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

