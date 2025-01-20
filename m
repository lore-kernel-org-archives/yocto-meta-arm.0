Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74469C02185
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 03:42:39 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.29940.1737344554533557468
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 19 Jan 2025 19:42:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=xuoAzP/T;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.52, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6d8e773ad77so34560816d6.2
        for <meta-arm@lists.yoctoproject.org>; Sun, 19 Jan 2025 19:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1737344553; x=1737949353; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y55mBK4sCIorq5LAz3M87RfGepPBoMYrZ7NGlXwGHOU=;
        b=xuoAzP/TG4AHgeKTSwDhlA6EfEm1/ghLaXjCR4oaAeddI6JG9/GdFpOd0Rh/L4HUMe
         O3pvhunJ2diqbDLWprGfWE0UJAlBggJ0IP7dnLG+nISIfBgCRFmDTuN7E2qwtVb1ioXt
         yexTqez9Mmv/1hsqsh8dFwXc11omDr9jtd10hZz80K/hrjDSgZ6K8OjHsolECr9YkF/U
         4PYVwQdGjDja17/hNJDu0hSSLY+Gcl6weLzaTxtRBO6t2BJSG7T9PlIbAQ+dF+sgemNy
         PtXGe8wD75FNrEQNQmRFqXpemu2SBVqeFpXWg6PmZ8IJYY1V1VP48Uiqo9us9juvneJF
         UrRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737344553; x=1737949353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y55mBK4sCIorq5LAz3M87RfGepPBoMYrZ7NGlXwGHOU=;
        b=FWFpeu9ZLdB9tav2oYBOKq3sOmyGNzMXt1ZcK8eh5B30eIZNxyJ2mh4cQrQATd9xR3
         Jzj1OGg7A8cnVC7prweCCPgH8YSj+mOSXr0XDqDvaZoxSZV3wMJoDPMDT9ZyZmbhaCa+
         2gbJPVpePAtKDdE6Wl51XaHa29HyPifAR0y9fIPq2xin2FE9NM0LI3qqnDywMXBCaOQG
         xRUnzrBLpD4A/wBUm01lrtKbCouw0nJK2EiUazVhVV5KEGEuwyiZIKgTEU4+bPyf1yuP
         jq5GdVOSVoB6I43M4U0n09Bychy1RRks/n3smTusLgla21ifMbcvKmk/xz3qXiuSo68i
         7lSg==
X-Gm-Message-State: AOJu0YxMqiLuKCQcmzBSYaIXojs3L6xpnA9nlp8YBsnFhj0dFUAGt5qd
	tlREoF9r7joy36MwMN19j6mGWpCwpU98AAktdMkfHcg3gqgOKNj91OpTlc5HMgeCl6knwBgs/jw
	=
X-Gm-Gg: ASbGncuHA29W7O6bqqu4NUEGC8hATMMMKeVg6wkvi17ncFWX+xbAJt3ZwQbP7F4QEmj
	jBJPNVcY4uthsEhQCTZ+0LII6/ip2CaUqhtU9YEyTypVSlAFZBQ7NlM6bs4mV1EoEiB/p9GazdT
	KTyotGTGcA+hDIMPvs0mNHZxDzRmeCy5Z4BvAtIo2tItRXHscCkpes9t3occxGnqxz76qMdxg/r
	lTuPDwte78UpLAUHtaWcz0VizNoh9KpYGMwTjwAliQHO7F39TOFeZV+HOK2Zw==
X-Google-Smtp-Source: AGHT+IFxDUr8hiSHvOcnOkWZj9DKRr1ZYZYbqQrpN7V9Xs6UgjtSkuUA3PdjZXnqGNLRr7LVVukrqg==
X-Received: by 2002:a05:6214:c64:b0:6d8:a70d:5e43 with SMTP id 6a1803df08f44-6e1b220d49dmr201945286d6.35.1737344553352;
        Sun, 19 Jan 2025 19:42:33 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afc11035sm37088826d6.42.2025.01.19.19.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 19:42:32 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	philip.puk@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/recipes-security: Add protobuf interface to crypto-sp in corstone1000
Date: Sun, 19 Jan 2025 22:42:18 -0500
Message-Id: <173734453845.344589.18094830019092870730.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250113163427.564404-1-philip.puk@arm.com>
References: <20250113163427.564404-1-philip.puk@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 20 Jan 2025 03:42:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6339


On Mon, 13 Jan 2025 16:34:26 +0000, philip.puk@arm.com wrote:
> From: Philip Puk <philip.puk@arm.com>
> 
> Adds protobuf interface to se-proxy-sp as the main crypto-sp uses it and
> parsec service 1.4 also switch using protobuf interface.
> 
> Signed-off-by: Philip Puk philip.puk@arm.com
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/recipes-security: Add protobuf interface to crypto-sp in corstone1000
      commit: 90123a287fb040a2086e6948230a95979b5755e2

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

