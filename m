Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33495CD5BD0
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 13:58:48 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21098.1779890325511533088
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 May 2026 06:58:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20251104.gappssmtp.com header.s=20251104 header.b=YPdWce7v;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.182, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-516d78df76aso55464671cf.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 27 May 2026 06:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20251104.gappssmtp.com; s=20251104; t=1779890324; x=1780495124; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xh/MLvtIYnm1ZGcXiL1nL5MrGhlmJ7DtOpFoKZviGP8=;
        b=YPdWce7v7z3xupjFQxM0sCd7VtYh3Ghtobo9IAQttk/cCHHp2ypX0x1K6DtwHj9Y5f
         HqaAN2iegLhNrRDvm//Kr8lK+Hw7eQV9ZwIOjbunMTFBObgmlV5dMR6HiH8feyC/9qGz
         l2e0rOInefA8WFlElqmqFubzY3Z/U4PuIame58RC31rP8RQEobnTmDNA5+2/O7KnGQp/
         9YgCkbeHdgJgdZoP4ujEkj29EPh1q/PFQewuoFyXOscyycCk1/U0colO1hPgNGCB1Omn
         MhJEYGw3Yhk2wXRt5o89xXaqGBEs3U85/cJWXCF7L4crB+1ywexejL1toyNvVMw6Vb9I
         oxwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779890324; x=1780495124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xh/MLvtIYnm1ZGcXiL1nL5MrGhlmJ7DtOpFoKZviGP8=;
        b=mWTqL0D43F66Ydc6Mpr9DlKVE88FTwmuWZvA9nsC2lYP8+8REoQsELPeBJrwT7xcSQ
         HHyutf2IL/+SiwNEiXSeEZkJ9F1Sq7EJUIIatXmxtjO4CLpIny92v7ehAKoFeyapcZ8H
         dC2lvrFyAzPXKesWhW56bQcEbQQpma90+5DOXlIycdjyvQAipc+osVyBGPKM+c6gb2ji
         1OBXkDARW8oiriqQ4+JDNZPXTWjRtOPxyq2vP6ky6g8immEPUEBTVdfvoIzNvymUkuHH
         5Iuacaiusr3OMMBrkf5KJaYC40oAXm5kNHS5V+UQ/eBESloR80l5/pPtfbgjrxEVreLC
         XyqQ==
X-Gm-Message-State: AOJu0Ywg3fxn1gKabW+kXv4ApauZ6k2xJFCo27AXYHXw/QFlUeZglN1E
	qu3W7jHKUvsJIIc0TpMl1lZgUJNF1J6LflczFpixpni1ObGrohC2/XcMYXoju3GrtjJIcQYuUgT
	7vPk=
X-Gm-Gg: Acq92OE2utnynKDhBPjDx9oPT061Im7h74bBTdve0crUAaZHRyB7ZB+E2oh0gw+wz/K
	+VTRoTKgTvcqfwPOHOKK5Sf7oML8bVIuFEMYQHxExDoaQa9unG4ersPK4KDzf09Vg+lbiJ/K3Gw
	NXgtGMakyFlfkeeLAJ9qur4vKFcqmlUcn/g/L5HA8Rx1BNFp4fo/kO2HBzaCbVMtAMJBxEG82cc
	lAe7XZrydZa5qnyOxhyjO8nvZ6oQ7H3B9Zb9SAHUQ9QFJJupVziB1f3zd1VjFOqlPsUfpOhFfll
	M0vmsdUKaskBp4WYAf7m4eEyO1m493f29EidOriBQZZvpqZzWLqYzwteAPmtkjhpoSXVwKwFGBo
	OJRi81WJwzn+L2/Llv8o+c78l7x7JDd0NDV22SoNisGHCzXhXFJYtKKqYBTnA6MPy/k02z3o3jq
	6rIjVeS4X4vFMfXLFR0J6Osbo=
X-Received: by 2002:ac8:6f08:0:b0:516:de98:b670 with SMTP id d75a77b69052e-516de98b94cmr287552261cf.39.1779890324408;
        Wed, 27 May 2026 06:58:44 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51706af131dsm42869571cf.21.2026.05.27.06.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 06:58:44 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Gyorgy Sarvari <skandigraun@gmail.com>
Subject: Re: [PATCH] arm/trusted-firmware-a: don't set LD if LTO is enabled
Date: Wed, 27 May 2026 09:58:25 -0400
Message-Id: <177989030565.2023861.16910148096655997576.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260524103928.3104830-1-skandigraun@gmail.com>
References: <20260524103928.3104830-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 27 May 2026 13:58:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7065


On Sun, 24 May 2026 12:39:28 +0200, Gyorgy Sarvari wrote:
> Some platforms (like Allwinner A64/sun50i_a64) have LTO enabled
> in the Makefiles, which causes a linking error when using ld:
> 
> | [...]/aarch64-oe-linux/aarch64-oe-linux-ld: -f may not be used without -shared
> 
> Add an option to be able to indicate in the recipe if the plaform has LTO enabled,
> and only pass LD to make in case LTO is disabled, otherwise let it use $CC (as set by the Makefile).
> 
> [...]

Applied, thanks!

[1/1] arm/trusted-firmware-a: don't set LD if LTO is enabled
      commit: 3c07303388bf1fa286bbb6f5b5b6189635787103

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

