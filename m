Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B09EC433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 16:17:38 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web08.750.1645460256953983859
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 08:17:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=WKekGROu;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.49,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f49.google.com with SMTP id a28so33233966qvb.10
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 08:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UxENklrFEOIfr+DpDv8s8NqxVOyqcv+A14NYAffoReI=;
        b=WKekGROu2rNGu45ZocDttYmSm2hUV4cEtqyIwYggJuf7Eb75TlApU+LRRk54RrWAyg
         DLR877BFBmdbaH4zONX2ArkP+vSL4uTvZhxA60UlfD4aHT1oVhSsTj6/o/GQXdbseGA8
         NfEqG4L7G2511v/7oPifyvHxcPnLZ3wLd6aDMRTwvZOek3pYlDfqIhsPUxmGmOCF6b7z
         c1IKU2WBedRmuyRwUQNixrDcOhBejS/2iCU+ZzdeyQRIRaW2Vqzhj5dqZDpNhfejcxiJ
         hgFhuu/ZPTnbugjw31uM9b6Mlq47LnB15ttG/NflAwWM/1Gz6EVDKT22ECaBLu14zUNc
         IYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UxENklrFEOIfr+DpDv8s8NqxVOyqcv+A14NYAffoReI=;
        b=1TgMF/SHV/1TQHIaFjocYgQr2prIDGl4Hu8ciWW51wRUL5FipsyKnYZ2e5OcVFSlpI
         5vs6gnEua8n+IVcKphMFswm/eKf0nQivWYkb2Lqsc6HRJ5lQiUEIGA6bx3w3RllcjZgj
         /fGtRLigE05vQJBpkcO+BxVuaABCt0+D7lVB9h9X5yY1zJpQmy56cBmV8v34FoBlgob1
         ulfOUIdQgZas3TvdqHxKufNWdW0Zzs5GpmQBhkwUFkL+fOBvf8j9MLXmW/FYXvdn88yb
         iPgfTT2zyvwbRdSaLMp5Q6DlogPgCrKbrFEJ2SjRPYo1zb3svUzWxl2giV0qBsO7tLNL
         KOgQ==
X-Gm-Message-State: AOAM531pfU4qO1HwdOzgjiwyT7mhSHUUQ+xGCYMNt5lyX83cWUFdf/EM
	dqIOXiY6QTbgHh8OSNWPUyMg0NzMs3GDMg==
X-Google-Smtp-Source: 
 ABdhPJzlrjHHAyssFKNWjiPk6xpuXCaRLt4l4DuejuOM9ZnpRWxpnXPyKCgGxSeRkZbE4hgfg+Pvug==
X-Received: by 2002:a05:6214:1510:b0:42c:8ea2:a3ca with SMTP id
 e16-20020a056214151000b0042c8ea2a3camr15747462qvy.18.1645460255984;
        Mon, 21 Feb 2022 08:17:35 -0800 (PST)
Received: from localhost ([2605:a601:a665:9200:d6b9:d916:b7bb:1a0a])
        by smtp.gmail.com with ESMTPSA id v9sm3701329qkf.4.2022.02.21.08.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 08:17:35 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"emekcan.aras@arm.com" <emekcan.aras@arm.com>
Cc: Vishnu Banavath's avatarVishnu Banavath <vishnu.banavath@arm.com>,
	nd@arm.com,
	Emekcan Aras <Emekcan.Aras@arm.com>
Subject: Re: [PATCH honister 0/1] arm-bsp/security: move TS patches to
 corstone1000 directory
Date: Mon, 21 Feb 2022 11:16:48 -0500
Message-Id: <164546020927.3944697.11122008788138097630.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220220133009.20560-1-emekcan.aras@arm.com>
References: <20220220133009.20560-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 21 Feb 2022 16:17:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3029

On Sun, 20 Feb 2022 13:30:08 +0000, emekcan.aras@arm.com wrote:
> This commit moves all the trusted-services patches to a new
> corstone1000 directory which is much more cleaner way to
> hold platform specific patches
> 
> Signed-off-by: Vishnu Banavath's avatarVishnu Banavath <vishnu.banavath@arm.com>
> 
> Emekcan Aras (1):
>   arm-bsp/security: move TS patches to corstone1000 directory
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/security: move TS patches to corstone1000 directory
      commit: 6dd18c2a80c23e5885362c7ec210e77a28fea3ce

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

