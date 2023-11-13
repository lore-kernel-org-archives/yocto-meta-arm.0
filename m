Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F76C4167D
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 15:47:40 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.40202.1699890457437368260
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Nov 2023 07:47:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=Ewz4WI1v;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.128.169, mailfrom: jdmason@kudzu.us)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5a7eef0b931so52929397b3.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 13 Nov 2023 07:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1699890456; x=1700495256; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sOqk5YJqpYD4QhDNVyv1/HJbsBEeq5jCDV1mxCWar9c=;
        b=Ewz4WI1v1coqLX4oEzc3S26Y8zu0rVi1iv2hSsVXDOnNH+QXxwHMsWo81aPeb5W8ID
         /l7v17/xPmI59kYCAfJygp+fNJ7M7PhvNg9Efee8nYkOpFIrHEhzfYDl0es15TcpC6I7
         iZVrpcRWbcUXPIaDMQItru+0Wd3Dl9JHmQ9OheEr1h69Zq+H/MR+mQE6fEnzc32Up1xp
         qAChxrAdn7slBotMCnjcEBPdNor2yZrFn06shNNSAEp1dJH6LKXWKmRSfMw9KjFP5ZJz
         ozQLZbJWIPqbCBTD+ACk66tc74qbSAVhZVBoQuPCqTvzCRUWyQqMXL0c78+eGwRhiZ94
         OStQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699890456; x=1700495256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sOqk5YJqpYD4QhDNVyv1/HJbsBEeq5jCDV1mxCWar9c=;
        b=kD0PGRKq251lPVQvlTCy16f/zQINsRjldowzNCKqE0TvMqoKR4q9bOrpStu4hOieZ1
         624AKmJqIK4zOonsXAJ9Gq/hj+txd66WO7Kp1ja1VkFP7iHRIHpMf+RV/lURHan7TDga
         YahXtLLPcM/XkWaLnOOnFSk7lfZpp6SR7IJzkidg4XDNeMWIr0tjCbdiT4K2fKJChc5Z
         H/TLV2s3wynAA8AOmiqb5Ft8QqB56R1qlF0xpZvgOCg2tutz4vjeQm59XQudcU3v6QZT
         vuao4rMqe2GNgb1Im6dy7Tms71ehZQtTRrkiYyXBTEwHx555RYj2+kscYjFdK9Lq4dTl
         guOQ==
X-Gm-Message-State: AOJu0YxWa74JgJuLewZ3roc8oOgyO8m11eWio5dR+38xr69bN6YqSJsq
	Ku7c7Gr+tDf8UAYfc0OiBaDE7Q+gBHSvbHjnpUE=
X-Google-Smtp-Source: AGHT+IGwAdtDVx7MIOw7RUCP06q3ZORNDxhLyfzjjTgRQDD6FImB4xwOY7/x+fnifhN0nmzrGjNhuA==
X-Received: by 2002:a25:687:0:b0:daf:81e5:d2fa with SMTP id 129-20020a250687000000b00daf81e5d2famr3847759ybg.33.1699890456157;
        Mon, 13 Nov 2023 07:47:36 -0800 (PST)
Received: from localhost ([2605:a601:a688:2c00:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id i19-20020a056214031300b0065b21f1b687sm2142940qvu.80.2023.11.13.07.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 07:47:35 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	ross.burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 1/2] arm/optee: handle CVE-2021-36133 as disputed
Date: Mon, 13 Nov 2023 10:46:13 -0500
Message-Id: <169989037229.1070071.14520083062566745586.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231113133100.2200065-1-ross.burton@arm.com>
References: <20231113133100.2200065-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 13 Nov 2023 15:47:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5232


On Mon, 13 Nov 2023 13:30:59 +0000, ross.burton@arm.com wrote:
> This CVE is specific to NXP i.MX boards which are documented as being
> shipped unsecure, as they're meant for development.
> 
> 

Applied, thanks!

[1/2] arm/optee: handle CVE-2021-36133 as disputed
      commit: 7fb2707adaa3ef25b48bd58e63b32161f9ba0faf
[2/2] arm-bsp/optee-os: backport fix for CVE-2023-41325
      commit: 721ed95a23b6e5cbe8a8ed9c0505eb02ff35d85c

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

