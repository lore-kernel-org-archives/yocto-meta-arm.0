Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E07EC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 14:42:04 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.12629.1699368114764514347
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 Nov 2023 06:41:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=PlxZj/LD;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-41cbd2cf3bbso55109501cf.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 07 Nov 2023 06:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1699368113; x=1699972913; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43nHNisGmTFik7GKREmTyP8dORR62uSerNq/uE34LdE=;
        b=PlxZj/LDEtCgFb8OKIBeiRG/SclK0KHWOv96iCAeGRs0OYWRvplJ1x4G0yqTMFbIg/
         Rh60CooIixvRV1697h7bWYrA4N+8UIcHXGtImviEUopsxHAEGagsGQWQiVLlLe3kB+gI
         fLS+LYArlyyZ1NaZiDd4eW19qVkmnf9s0XxeC7CLBbVbhcMc2ELXCQqQtbPU0/+hU9Sd
         aER/2l6uJRFLcSOtx3sIfU2NkwfBLExG/cz7s3WZlA0ZR7IC2VAOchEzzL8+JyB/5ZZp
         ooztTWXG+XNN+zHsH6rEDnC4cV0ySXZHWizHZacgeKEkn6PnECwfC/NM4uhrkRa79g+E
         Y8qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699368113; x=1699972913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=43nHNisGmTFik7GKREmTyP8dORR62uSerNq/uE34LdE=;
        b=SRuOxObQpNPm795asVETIdGByJwPvn/KVE9jvL1/tpiNBAxX0ZJGMCL37/YgdO9swR
         msKgCJYHZa1lmq8EqaUMnYwZI/fWa6Op3/iQTgbFFHhLQrT4KmSTY9vLvqGjYJHdJl0n
         OBC4ICPPmuzBMzj7H4ttAvI8w8gRwN8vMeBoB5NH9yRvLSIEJCIhNYLXpN84RKL1p34M
         4rqp38qefmnD8uiSHHABMna15T+CLhyZKDKA42OIPEESCsGCccAvF+XKWppZp59j3443
         Wzueu4AmCwbCeYdITQw+GcP9gN7h0gUO/YiEOE1AMu3R9xjZgk/KfRqdUnwUVph+2CpV
         6bCA==
X-Gm-Message-State: AOJu0YzDmmVzVXd5v1s2DM+bFK3NEvW7W8iMtGNmPzvdfyLibdZdbrBt
	IBIj0Rj4UUkOyGqB2orSkGbHjtQy8pWm7j4j4nc=
X-Google-Smtp-Source: AGHT+IGOxhavRxBlTPJGKp55qxZ2five1HKETi3gYEGCqBwAf3xP9bKzw1bgp0oKeRudT0rc/gGDRA==
X-Received: by 2002:a05:622a:311:b0:418:a80:4529 with SMTP id q17-20020a05622a031100b004180a804529mr3731747qtw.16.1699368113440;
        Tue, 07 Nov 2023 06:41:53 -0800 (PST)
Received: from localhost ([2605:a601:a688:2c00:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id bq8-20020a05622a1c0800b0041abcc69050sm4346960qtb.95.2023.11.07.06.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 06:41:53 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	ross.burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 1/2] CI: Add meta-secure-core to pending-upgrades for corstone1000
Date: Tue,  7 Nov 2023 09:36:57 -0500
Message-Id: <169936781962.1895078.11500480307683432949.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231106141942.1047477-1-ross.burton@arm.com>
References: <20231106141942.1047477-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 07 Nov 2023 14:42:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5214


On Mon, 06 Nov 2023 14:19:41 +0000, ross.burton@arm.com wrote:
> The corstone1000 machines now need this layer.
> 
> 

Applied, thanks!

[1/2] CI: Add meta-secure-core to pending-upgrades for corstone1000
      commit: ea3171ca8a66507898603cff0312e8e21ea70d36
[2/2] arm-bsp: corstone1000 depends on meta-efi-secure-boot
      commit: 5640473619e96eb088402d6ecec773cff93244bf

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

