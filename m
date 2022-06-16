Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49521C43334
	for <webhook@archiver.kernel.org>; Thu, 16 Jun 2022 15:36:04 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.19324.1655393760176911600
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Jun 2022 08:36:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=0PNwoj+D;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.43,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f43.google.com with SMTP id v10so2588664qvh.9
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Jun 2022 08:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QdnN32TGqLZvp+EXZAW2E99mhKlTQeBPCXfMAwDhn1Q=;
        b=0PNwoj+DhppLqbi8g0ew+uDzv0EEBwX8h8l2A9iwrMKbZwfwId8l02OCqdHCCLxz6f
         Cb5ibvxFKHGaoa/Hqu4aHjTz05ElXNkpG804bmuNwDQjwj1i+wz1x2T6hgbMKg1oGVCI
         Y+Pc2FKib7FwtZ4kAEYOs+FHUufY9AIQe0iezI8PcKxskPaWLTYqUz+X+zL8AAcddeDT
         DAr09C3+Qsjo6Pl3wYWAtTeZUWv+0I5nYLCSlG4hXnZh/jeEasfQk0IyP4V02Fpfj/7K
         dQkVEZXnc9XQV5D+csHT2Q7YhT6zEzZGHTk3QLF7jaN5GOjh+cG9UYSoJ4eyoIqpJDl6
         Y6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QdnN32TGqLZvp+EXZAW2E99mhKlTQeBPCXfMAwDhn1Q=;
        b=idHjHj15WOeAVkIolPoLa2kO5OyXBjlJ+KvW7K5pW21HbVPtUJ7r3HykFa1Q59xU6F
         JzknQPhWIMaN6we1mJud4sfsKCVLbz2jfpVNr2dZ6m2MVNF1lw6omxCvfyamHheSfQH6
         Y3aK5XSOto1Rsk27zQ/y3nEiMFKMCkVhsYxq7zhwG0VPsXPBLYFBGWwV9qs7l1LPZPz+
         FieaH1mQ8EF9F/3BIvg2LNCOw1eOyDUcodHRiEb3jhbhdAm1szrzGcb/PaEjriotbyf2
         rPN5Ur3WJQc6FPyW2l7mAUtP+7i/V7EfpHjCxzoKfWuDAyNfRDioI62C5/7iR7LRtUsk
         lITw==
X-Gm-Message-State: AJIora+O9kv+O0s6lG+XGcsSaQaGCt27D2jJFOzoYSZ02QAeac8S2NaT
	3kKpGi9JyVDVoVO8BT1sixv0MpIkHEQxqg==
X-Google-Smtp-Source: 
 AGRyM1shRm2mu8RQdQZK2UndoNQS62qZRQYs6JVFlDUfd84YIb/T7rICk+Ducxc9rQTNlrtS9QpBgg==
X-Received: by 2002:ac8:5904:0:b0:304:f0d0:ed16 with SMTP id
 4-20020ac85904000000b00304f0d0ed16mr4403014qty.475.1655393759125;
        Thu, 16 Jun 2022 08:35:59 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 bq11-20020a05622a1c0b00b00304ed2c0f25sm1864298qtb.50.2022.06.16.08.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 08:35:58 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH] arm/edk2-firmware: upgrade to 2022.05
Date: Thu, 16 Jun 2022 11:35:40 -0400
Message-Id: <165539373972.3162929.10617744920004547852.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220614203013.1779871-1-ross.burton@arm.com>
References: <20220614203013.1779871-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 16 Jun 2022 15:36:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3516

On Tue, 14 Jun 2022 21:30:13 +0100, Ross Burton wrote:
> Add a patch to fix uninitialized varibles, detected by Clang when
> building for Juno. However, whilst it now compiles it can't generate
> firmware images correctly, so it has to remain forcing GCC.
> 
> Remove the workaround to force debug builds when using Clang, as this is
> now fixed.
> 
> [...]

Applied, thanks!

[1/1] arm/edk2-firmware: upgrade to 2022.05
      commit: 67b662a99694e4bb6e1092d20b0f9d8b1f96e51e

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

