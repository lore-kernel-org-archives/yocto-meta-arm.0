Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59F94CD98F2
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 17:35:00 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10229.1781976890877247946
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 20 Jun 2026 10:34:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20251104.gappssmtp.com header.s=20251104 header.b=vZLjKZuU;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.42, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8e066990fb4so4766476d6.0
        for <meta-arm@lists.yoctoproject.org>; Sat, 20 Jun 2026 10:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20251104.gappssmtp.com; s=20251104; t=1781976890; x=1782581690; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ZNgTp5/UPowbWMc4MpE3b3PXL946qJqSjGCCcZOTS4=;
        b=vZLjKZuUjwGqnaEJbqJ8UVtQX/bBKu3+SyQkv3I7ex30UD2QKG+icFvx0ZeqItb4dt
         UxUHTBzqQbLroIMR5RmI8LMVePmLf+edS5RfPHbE5TOrlJupqbfhaxWEeejfxo9wW/Ky
         7XtRK4JXP+Odr3nUtTbPR0h7/BpLuZmharXfRMnbEH6u7n6wX5xyEZoocDdomw51ISSX
         Q9MhdHL8alzFKdfFQhc8Yzdf3f8hKWNlTy/+R8a8hgNiyi+bQZICQu9ev+a7wZR1gTk7
         Qv+BoEBKKUj9mlxkWMxfgWt09c+hFywb10cjYjCudszPx2KwVknkebO9sZ5RAg2oTB7I
         5xMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781976890; x=1782581690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7ZNgTp5/UPowbWMc4MpE3b3PXL946qJqSjGCCcZOTS4=;
        b=hIJfdc3LeRdYmNWoIEwVEUBi5KmiSIYHm3CO0aATJF7bmufBC5AbDHasXG37vJImye
         TfxpC4sVB+sLC/pqOv8LmB0/9PlD5yD3aGE6uXgxjK25QgoznYhgtTwZ7UApdPe8rRnw
         uL7ejXjmHmrnCrKWrJJ2RhG6ZfBH0uXvzvBdpjwVLA5sAHPNSgc3ewPWrFAB77um9Dgo
         yNMEUoy4/NdnJQaz6BtwSWb7oefQz59H/mUAdB8y/gLWluCKkJumPVGan7vFCSSTNUMo
         moFJVz61EmcsLnDcnFkmmkYSIRAtHl7CuKXm4aiXIU3EeQNcxrBpP9SvQ/OZgcROT2WC
         mWgg==
X-Gm-Message-State: AOJu0YydOaJxVcb15wBtB/Fqv/1iFI4oYuFwJWcSuchp0t46g6KS/CZB
	5RXuKLMfeut9jhkZ53gz4Vb1RVz3WdqWpq3E/nRzzfzBze6WC/sBgNDMC1A3tL2AsAB3Rw+3ljL
	SxE3b2A==
X-Gm-Gg: AfdE7ckXVVFNPS1PIkwW7YGa6hBsuggo93uPCZGCqmM6aC0000MWtj9v25BML1tRjw5
	ow6CdVvpfWMLfDE3MhhURkYHWUT49EId9QAo+KXk4v8HF/+kpwQICDApNN+wCM2HPpsPqlk9Nqd
	3Vpu1/2DmxKEWyDkd6TKs10FvusHCKnkA8Ep+bUsvOZKTTw8m+PoXLXmtrFOX3QkObKf9qU9chP
	J5XP5XSGrA9QgFBMjCyYqG3bouwpxcU02UlbB4cnvM1wJi7UdFLsInP58KWH5yG77G3w1UrP5G2
	0r0dPh8aO+b1lGqjy43sfJuHXJEBB/e5OR08RlkDGizUGWNQ5RWSmHCt1m3VqtQprkCn26XRkEY
	RvHlykIqshdRYuY6wX+AuC6l7yWS9MAX4P0O/uL3EXwsGv+7LW/hpG5lxAFAzkwRNy5K9Tn8gHr
	+v6A==
X-Received: by 2002:ad4:5e8b:0:b0:8cc:ea95:2261 with SMTP id 6a1803df08f44-8dea4a7d71bmr135809526d6.36.1781976889669;
        Sat, 20 Jun 2026 10:34:49 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df823ab84esm37078056d6.37.2026.06.20.10.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 10:34:49 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	arthur.cassegrain@arm.com
Subject: Re: [PATCH] arm/trusted-services: enable devtool modify for ts-psa-api-test
Date: Sat, 20 Jun 2026 13:34:37 -0400
Message-Id: <178197687884.4020114.7994777155776259135.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260617122329.2485831-1-arthur.cassegrain@arm.com>
References: <20260617122329.2485831-1-arthur.cassegrain@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 20 Jun 2026 17:35:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7093


On Wed, 17 Jun 2026 14:23:29 +0200, arthur.cassegrain@arm.com wrote:
> Place psa-arch-tests under ${S}/ts-external/psatest and update the
> recipe paths to match.
> 
> This keeps the external source layout aligned with trusted-services,
> updates the Corstone-1000 patch locations, and lets devtool modify work
> against the same psa-arch-tests tree that CMake and
> apply_local_src_patches use.
> 
> [...]

Applied, thanks!

[1/1] arm/trusted-services: enable devtool modify for ts-psa-api-test
      commit: 8df56513d9b73ddb560e362988333bc065146a91

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

