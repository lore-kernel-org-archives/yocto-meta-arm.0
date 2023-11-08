Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F9BC4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 04:52:03 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.7520.1699419117969374802
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 Nov 2023 20:51:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=lRlFsiO0;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.48, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-66d0ceba445so36993406d6.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 07 Nov 2023 20:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1699419116; x=1700023916; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kH00WrZe5qJJaHp1WVvk4wiMehE31MXO4mv7gEfaLUA=;
        b=lRlFsiO0QKVw5wHA/2Sniw1sei1dfVL2V4U4+KTLJ+0780Xze7Z/DE+uNtYzknemZS
         oWg1kzsxM5KgwvEv1pzHMjmhrb6yvaYdl7EMEIvGdJvuSNEiXon0dcUIP2be+LRyG2GR
         l/XSTKTIU1Lxjs0JHuNaR1mzRREUe+s0FurSJGnni/2bFqaFDQ2NU18YPRfprLTRLqNI
         IMARNczYRwDP902Q9NqjbyaMOw/77o33jSK3HB8//W6Z0nkvjU6mDc58R/QH+/3efqIQ
         27+f38SYkR5I6ATMG7d9eYcXZi9G+6HAolWw6oKFeaNfNViWxj91+zGi8I3gaHCBS3oB
         57PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699419116; x=1700023916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kH00WrZe5qJJaHp1WVvk4wiMehE31MXO4mv7gEfaLUA=;
        b=oei4fzlxa9hiviSvXEeuubJjBnTjWv8oaEgHiiiyiLs6z5ZW2nBhRy2O5kDuJ0+4xi
         yFSsCfRQN7NQmwF+0M1f1jHVZei+xb8MIKZGgpnSrlAvUaI/gIwQAUeOotH955CiZAa8
         wXKhjbL3x/zOt4A/1LNdoRvM2j13l3EtiPSa8q+vmyVvpSJAe9rTPgCh5ehfCCdq/X6g
         a4LDaF5DbfycMCmk9EZ6/3vUUbO03v+UN/YOgljMvTUhvkb0+sqMWgzQjeZz3E4SlG03
         ibfXxCb4S0QH7zevf+54b6HqJZXg5Yqbbz96+ipNVOwnKitYZ4o2NRVR7tM+Sjn/gWc/
         E0hQ==
X-Gm-Message-State: AOJu0YyqcNzCxmLVOSKWQeo+iepc2j68SbZgIPLYrzo3vmKAAtyDes6q
	rd+9mwDdICC0CRTVDys73nQc/4gVY1/NJfEbQUE=
X-Google-Smtp-Source: AGHT+IGwJYwBrKWQgKkj6R52XQWmN3HqZxPSJM86DMQRNVk+NCAOTpLhnu9j0WJusvpznZ1WcybiQg==
X-Received: by 2002:a05:6214:1cc4:b0:675:7b22:4f74 with SMTP id g4-20020a0562141cc400b006757b224f74mr814533qvd.18.1699419116102;
        Tue, 07 Nov 2023 20:51:56 -0800 (PST)
Received: from localhost ([2605:a601:a688:2c00:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id l1-20020a0cc201000000b006616fbcc077sm664459qvh.129.2023.11.07.20.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 20:51:55 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	ross.burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH] CI: use nanbield branch for meta-virtualization
Date: Tue,  7 Nov 2023 23:50:41 -0500
Message-Id: <169941904139.3102675.15804028428453384470.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231107170505.38990-1-ross.burton@arm.com>
References: <20231107170505.38990-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 08 Nov 2023 04:52:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5218


On Tue, 07 Nov 2023 17:05:05 +0000, ross.burton@arm.com wrote:
> 


Applied, thanks!

[1/1] CI: use nanbield branch for meta-virtualization
      commit: 298b1d82d1e72238f4303662a69fb317a8eaabf4

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

