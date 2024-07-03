Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EF7FC3065C
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 02:51:33 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.41727.1719975091818887740
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 02 Jul 2024 19:51:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=eN4oBaEf;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.128.174, mailfrom: jdmason@kudzu.us)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-63bc513ade5so41573187b3.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 02 Jul 2024 19:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1719975091; x=1720579891; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=19kY1GcpL8IboyBLe+DxAP6lLJ6UKhTPg3mllhCeqNM=;
        b=eN4oBaEfwTzYHMxr+ZUO9NIIX7jkUTlyxy81HYJvRqmMPEFLN+aaN+MzciF9045DAf
         hH7nDlHhahEe/Z08QiV214aeWZS4rmlGvcGpPjcf5Ttfk0EpGC6XYafLKEJOxYWwCJ4q
         EK01QZHExYsBoOHfCUBnp7VZK1rEVXFyhGES9Hi4YuPJ+ZpQ9QMgquHR7fybsiumjSev
         hKdR8sUhZDTKYkqyupoMN3tgCg2j8nfrN54zpsebDNs2mN3/124dTuN2Olu+wmVlGGl+
         8iseIbND6WqjuXnfk/efQD9bS8tWB5YjiFotwyCqQNtLXHyUMpTD29/9oMTEly1jfQjc
         D/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719975091; x=1720579891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=19kY1GcpL8IboyBLe+DxAP6lLJ6UKhTPg3mllhCeqNM=;
        b=bs6wvT/4UtpN0zSPnpbTVJvqa54HACsnOTwg7fnbu8uKMKNfNY81mC5uPNS28pQDY/
         Csd2tHJtR0MR0ZZxyenE2nInWanW6u1anvxTjsH4NErPZpJwLoIrbdRmcqsXkvT0s2n+
         4PGEfDDX+jE6bnWCQfbBQPkbZZts9Pb22eibuNecKfKOwj7dhZm4aiIZPA9+q5vW6Gmx
         DeuGzluZ3xiwgC20zFabfELFwndbGfwCZ0OmHFal8v8ObhwDBdqbCFKhfGd8LMLWgg+k
         voqWiI3+NCqrmQD27Sc/Tu5xLLHNYB344NTA2RONH1+iV6gblfiGfODQ3AByNbtkNLQ8
         mVWQ==
X-Gm-Message-State: AOJu0Yyl7ukjrtybQ0M5+MZS6tUqZLi1vsadUiy20goPItWzsAQVjyXR
	GvwStnS0jowvw5VDSZoH/QJ9MilqXjzS1fEqLZ4tMn71yv7Vk/BspFWe3FrryhNbTeB1Qss0LNE
	=
X-Google-Smtp-Source: AGHT+IHvGd8yBeO5O5d7mu+PyNW8LVwj5VrplzY6vjfkEt+7Z93QvJuomBaxTZ0sGcBhcQt50zoZig==
X-Received: by 2002:a05:690c:a9e:b0:620:3c10:527a with SMTP id 00721157ae682-64c7268293fmr144373907b3.15.1719975090655;
        Tue, 02 Jul 2024 19:51:30 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-64a99d65db2sm20235637b3.8.2024.07.02.19.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 19:51:30 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] CI: remove ts-smm-gateway for qemuarm64-secureboot-ts
Date: Tue,  2 Jul 2024 22:51:21 -0400
Message-Id: <171997508121.587178.14364417494455817996.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240702193553.34632-1-jon.mason@arm.com>
References: <20240702193553.34632-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 03 Jul 2024 02:51:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5862


On Tue, 02 Jul 2024 15:35:53 -0400, Jon Mason wrote:
> uefi-test is failing on qemuarm64-secureboot with TS enabled with a "Bus
> Error".  This regression is caused by the update of QEMU from v8.2.1 to
> v9.0.0.  Temporarily disable this test (via disabling ts-smm-gateway) to
> get CI green until it can be root caused.
> 
> 

Applied, thanks!

[1/1] CI: remove ts-smm-gateway for qemuarm64-secureboot-ts
      commit: 390b9824ddda6b1443961ce3932957944a1bde2d

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

