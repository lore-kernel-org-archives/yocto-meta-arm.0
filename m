Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14822C433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 18:55:46 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.1972.1646679345217635961
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Mar 2022 10:55:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=ovv2UVi/;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.174,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f174.google.com with SMTP id o69so266127qke.3
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Mar 2022 10:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jReZGM50WpXjw/As4/q6Tb9f4MP/kxeG/M6K334LxOs=;
        b=ovv2UVi/80JQMwwGAJH9p/xdkR7nJPQPAzab/aIun2KEo6lTuZ/h69exf9MuUzxHNM
         MOP+8fMzqVVRb8yo1WoqWa7zEi2XwBp6hfeF7A9lou8Ly8ftsxN5jiG5vWUW67XZb50s
         Fv0NnE4JIBqiyCRQ3kOdvJGylS61wb6HToPo6G6SmdjGY5czgVTfOU2P7qsIebwxkGi1
         UJ2xep4F3NbWiwWFfBCvPNHJZrTAIwJkH0RzfDawwL6jCy1iuhLNBbMLUaYFKvbktEsu
         v2OQfvEfZpzjroLQlpgo6YKvjzcKGyB1T+fFUM92pNVH+lXz0mKTOMhU18GAap0evHXs
         a1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jReZGM50WpXjw/As4/q6Tb9f4MP/kxeG/M6K334LxOs=;
        b=Fo9thXGPjZJTpUreieFERTrZia1RvjajM9Ijt5KT14tv2Sa5+LugdQbmqiJh6Ht1u0
         nLtRTFvGjFBkQHX3WJf4iYaO8HHhAt92tFVmyAwLG914xry37qOiGvLvf33uL4w5lUMv
         DWk58PbYm3vqHiHXSiycV6/8OGui/zAq85HOVJCOt7GcN9DXSUlZ/R+dBEJoG0hsFLTA
         vM8ZQXoRCHnauHXtkI+gwRoAFxGEfv3yyksK+ijVR/JchpWxNsl6vxkRwq18F03ZMuov
         e8qg4hHHyK8qpoWGyg1m0T4HODzN0ujBnmFJ7ArQGvjOke2OQeQJ+hhAeGUA4CRvsVH0
         xtfw==
X-Gm-Message-State: AOAM530Ra/9k9Sx5nrw/GUiLzv1daSR7BgZnbuQ9QmAcnfxjc9Gz3bdr
	DuuKcYASl3k/pi0JC6D+vaIXk0OhIV0+pA==
X-Google-Smtp-Source: 
 ABdhPJy4XOyxJjcWgqogX29cKjxaihA1TzUyyOUC9jjJ4K0Bn9dlLqtK5hV/DC604uEjxZBRHNDdWA==
X-Received: by 2002:a05:620a:290f:b0:67b:3212:d529 with SMTP id
 m15-20020a05620a290f00b0067b3212d529mr2953749qkp.4.1646679344180;
        Mon, 07 Mar 2022 10:55:44 -0800 (PST)
Received: from localhost ([2605:a601:a66c:b900:7502:be68:40e1:3841])
        by smtp.gmail.com with ESMTPSA id
 c11-20020a05622a024b00b002ddb43850fdsm8894890qtx.15.2022.03.07.10.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 10:55:44 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] arm-bsp/linux-yocto: remove upstreamed corstone1000 patch
Date: Mon,  7 Mar 2022 13:55:38 -0500
Message-Id: <164667933815.712238.993123825773884403.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220307155815.2814399-1-ross.burton@arm.com>
References: <20220307155815.2814399-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 07 Mar 2022 18:55:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3123

On Mon, 7 Mar 2022 15:58:15 +0000, Ross Burton wrote:
> This patch is now merged upstream in 7285daac, 5.15.25 onwards.

Applied, thanks!

[1/1] arm-bsp/linux-yocto: remove upstreamed corstone1000 patch
      commit: 8b377a5c7d71deedc36a3fb6acd33e8b19f1d4e9

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

