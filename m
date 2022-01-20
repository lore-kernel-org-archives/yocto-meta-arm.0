Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB2D4C433EF
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 21:05:13 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web09.2501.1642712712386569549
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 20 Jan 2022 13:05:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=WrbOtQmN;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.50,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f50.google.com with SMTP id o9so4155937qvy.13
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 20 Jan 2022 13:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wnUSiD7TVY2fnbfw+yKmyYcPR8dvsuUONr68NgwhF6k=;
        b=WrbOtQmNyjO1hwUJO2rBut3Y8hJQntRlpXP5rosFb+EqfaVYR2ulRpbX5sLNlqCrVb
         3oXdFwSWf+o+T+7jKxcvT7Qp4p54vbM4MerR9BCFqCHHa20EnK3zomcqTrgxzQpSbKny
         updQSACvaKjB5JHWgm2FXusYPhMo1j70dWJ4HB8zobCeS0eEFiFRDlRuA4CUKtaLrlSX
         iqSJk/EsXuOvf2aWaPfJI4mdQ3K3v7b260q7Qy84XXuLKwjLt4OhrgSuSTXwqSRF5mVa
         DPgFLhDz/savRe4LpVV2tFLkdIrhBP1/Ktqs042oPH8bSdxFXmaUg//87465FLBho00Q
         P/8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wnUSiD7TVY2fnbfw+yKmyYcPR8dvsuUONr68NgwhF6k=;
        b=OlhowTWURMS07dnCkUmTxHVDmQrXO4T0KM1bHlCbj5heY1W2El98Uo4uOxISIzsUY4
         eMQPFefJ50vTjIMP1JPMH0GTGzh3oRqKBy4NeFwuYz/W9SVOsLyqyc72yBfulLtxEkwG
         sbci49n7mgS0kctC2yv0LBBQsdtg7zeKLefw45w9k9W6jNz3EeVTdQsTsB1EDnlIj/qH
         8coI6qEUC4FfrYba+nJBvKkIg1gOYUvXCGROIU+KIl/5MJ4519zUDGFKZ9JvXdlhHUDc
         nnadx0VYzLo+hD+eRWmH+LpVHbtSTAXwaCiaWtQ0K5roFZlUTf6aDdDZUbc3ACbS38+2
         XbDw==
X-Gm-Message-State: AOAM531S5pusqxWAP+jyZCr4Cq0xFFVziERkSFmkrufdZTU1GVc3DdIN
	Y2llpy0DDM2iTbVxNvJvEUJMaaVJGpNa/A==
X-Google-Smtp-Source: 
 ABdhPJxkImOcHu474arYamIkpNI3jbjiumxaEZi8hr1VM3pzMKQnTNMc1CXCrIg9U0I4b2K/oz8t9w==
X-Received: by 2002:ad4:5dc8:: with SMTP id m8mr826129qvh.11.1642712711303;
        Thu, 20 Jan 2022 13:05:11 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:86a0:fa:bb0f:c64d])
        by smtp.gmail.com with ESMTPSA id
 bs37sm2161455qkb.69.2022.01.20.13.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 13:05:11 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/2] arm-bsp/optee-os: clean up TC patches
Date: Thu, 20 Jan 2022 16:04:58 -0500
Message-Id: <164271269832.2785250.7499320455363128128.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220120191221.1955545-1-ross.burton@arm.com>
References: <20220120191221.1955545-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 20 Jan 2022 21:05:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2886

On Thu, 20 Jan 2022 19:12:20 +0000, Ross Burton wrote:
> Instead of patching a file we patched, integrate the changes directly
> into the first patch.

Applied, thanks!

[1/2] arm-bsp/optee-os: clean up TC patches
      commit: 92ad824b703a5489406c66e04222c9c902c44d20
[2/2] arm-bsp/secure-partitions: add missing Signed-off-by tags to patches
      commit: 0c0b88bc56f516a677b82b31df2e823660f2ee3f

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

