Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FBECC47422
	for <webhook@archiver.kernel.org>; Sat, 27 Jan 2024 03:05:20 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web10.8834.1706324715951506848
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 26 Jan 2024 19:05:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=djUDnWdP;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.181, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-42a032cf012so8603151cf.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 26 Jan 2024 19:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1706324714; x=1706929514; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WaxJhb6kYWIeRfTWCwTjDvQ5qicJKqKoHBljuLBeAh8=;
        b=djUDnWdPteN3N0v1PdrlU9wORIlz7rwGJNQBBAvBd8ou2faefn/+n93WkmigXKu55x
         8M0tbIKv6/LVV7MKRcCnk68VAtklq9mYyBzjpgb6RSHiuDVOWEZJ/svhdIOFCOKdzh+x
         hsKzwkAHL9LgpnB+q8a4/8G92hI/LRyBpgDne/cXSQmT/DmcoqHT08nFCMH9fofPDGtH
         gp5v9yICRoWB0uVZpM2TzuAu4QPJ9hxFRSy+v6q3yYwUo6k/kTbypp5WPDlm9idNb5VK
         c/xq7+0ecxxWU/PEbO7eE3fm9WQqSWMu2TS6n7wFbBPMqzws/yo9cWyTyS5jYAyfHnWo
         UeXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706324714; x=1706929514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WaxJhb6kYWIeRfTWCwTjDvQ5qicJKqKoHBljuLBeAh8=;
        b=XYfnibWjZQ0GSjj+aJ2egHczsZ0nCYKJ4Ag4+6YXgrG+B1z8BKuj8+OE3d3Rg87qs4
         As3Sf+PkBwFLnWpTUvFImWkpR+6Bsy5LVpTiC9YixYhjDXshY9Qx7hqnCLBTAEaLmAPP
         wV8IySagrgEjvrYY7JC3BY5vHqAxUZCQGGhMD7+DxVpgrOvGplGPE8QtAt0bTeieXSuP
         tx1AKagHUhWOlyxqKWPFsE8FxMBbUvg17qNYSQ9XcEpCxZUpHPXb9AkIHK+xDCUhA67I
         n6tOumncR94X4g+biG+K4plkrlxnAZyA3kj7Npmx+KgLv87rDw3ED21dvdHRDKVNRi4y
         /aeQ==
X-Gm-Message-State: AOJu0Ywt241FNp4H8vghJakX3Fe1qUCX2QMDDoZkfChiI6Kw7Z1WDvtT
	JDeaOZoXKBAKVouI9XrBtkuIaAAEP66UCc1XsHubH0A1gpFx++0USZXWIczQVT2DLknsy8xrF08
	=
X-Google-Smtp-Source: AGHT+IHpjOIp8tlzFErxQn44005o2bc0EpvnD5FhU+wkOzD/Dz9y5z/hdPTihh1IB9X3Su0PXh9Elw==
X-Received: by 2002:a05:622a:1050:b0:42a:83fd:1b00 with SMTP id f16-20020a05622a105000b0042a83fd1b00mr1183242qte.91.1706324714196;
        Fri, 26 Jan 2024 19:05:14 -0800 (PST)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id bw21-20020a05622a099500b00427f8c50f31sm1125149qtb.46.2024.01.26.19.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 19:05:13 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	ross.burton@arm.com
Subject: Re: [PATCH 1/2] CI: support extra kas files from environment
Date: Fri, 26 Jan 2024 22:04:48 -0500
Message-Id: <170632468826.1980272.8306020456138460200.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240126164341.2846181-1-ross.burton@arm.com>
References: <20240126164341.2846181-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 27 Jan 2024 03:05:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5367


On Fri, 26 Jan 2024 16:43:40 +0000, ross.burton@arm.com wrote:
> Extend jobs-to-kas so the first argument is still the GitLab job name,
> but allow further arguments to specify extra Kas files to use in
> addition.
> 
> Then add a variable EXTRA_KAS_FILES to the CI configuration that
> defaults to the empty string and pass this to jobs-to-kas.
> 
> [...]

Applied, thanks!

[1/2] CI: support extra kas files from environment
      commit: 827129b05b22ba4dc305cd23ec71cb2387dfdc22
[2/2] CI/cve.yml: add a CVE-checking Kas fragment
      commit: a91ddf4869806cbe92758f528afe4e51329e9ae0

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

