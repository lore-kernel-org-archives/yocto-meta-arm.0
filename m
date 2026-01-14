Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC835D3901C
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 20:33:57 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20327.1768422829864454545
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Jan 2026 12:33:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=QZ/vJNHz;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4f4cd02f915so1395691cf.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 14 Jan 2026 12:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1768422829; x=1769027629; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LbwhrSQ4ma4hqdWM+g9iV46oDrEngAiii7RjrhMOP4o=;
        b=QZ/vJNHz9KRPgJJsuD0abLUMBQZNz3gVUY+xwqMrUU+OcdtLW4qcX46dzJd0bmSomr
         95BrhH5QlFXbd2cpNgKVxjzy2ijQRfYxPxPyIFT3VvNDWmo7IDvwJ+v/WpflISwTYTve
         m50AMAAuxEaHKc+fGPG76qvzMGUcmNBvDSKPpXcKUu417Tpnkajim/93hi2YAsB2Ar5N
         oCUD7kzV0ufD6epd/b+WJUtUxl+4hxeNQrpd6geEwv6k+nvDiEqj3bmsDr7qeeY9lOcG
         rYVGkMzvt1gomFltRbPfd7grAQsM4ZgW2DGoQepnQ+8pbfuw/lwNljISyjCJl9XUN5+h
         aj0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768422829; x=1769027629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LbwhrSQ4ma4hqdWM+g9iV46oDrEngAiii7RjrhMOP4o=;
        b=s4CF8m6a166+pF5qWG+QmDjB2Q870ivPnr0r7fOy3786CKHLwdRWMKP5HFlviGlvRA
         jsJozgmKepBzfoH3a6C75ZWEp+vvr+FqR1RycF+vavBddtTqkly1CbOfHePcfQOMS4E/
         iuMzuxemIEoo4SWSRhO/q52RY90/QJ+O9iPG4E4yvhfm0RJzdAONMHf0DAiAH8K/h7+y
         xx/9IARNOlcMzdUky4mi7Joa1NLTtD5wjDutLCwy9bAzt+p9nf/qHemf68AaenHAFZXk
         S2aqLuC1L1eYolZHUw7CHHW2+cOPwiBsVWo30rIRWfquOK2YpID4TLwfzng2Tf8bgG2t
         JdYA==
X-Gm-Message-State: AOJu0Yz389Ix/RghkwS6C5yRzTc+pOxrk5umFg0PshSvjC+53RrixaJI
	3BrNh5ugj5yTtQsHoUhr0hg5mcAzb+EMEkdP5LWpAKQkE+0fc7GXgyo/x5yHYZqVch1VCdnpJEb
	VBOk=
X-Gm-Gg: AY/fxX4W4F0Fta4dqK+rj4FG+9DlTpNo8nimiFa72c6rWec49RY/N9RLcYRIeP+C1ST
	DkhRCTI3Ye36D/pbbysbxMEzgANnsacHtbWI3XLRE0EBeBvra11Knec3Hsidby3dTO/t/CnvVLx
	fMqPWjjb3hguVoIf0HqD9dPVBPb6VjEyHhonJgTwMQZ3Qy7ZbTVSEpsL4dMTZkZnNmdfjNTr9Tm
	DFoliW0rrHkzA7gFtD3tHMEYobJaT7k0ym/U1pEqphKAxDDdjzNgfVy3NznoqdTd/icELGjhESu
	mUT3qhKilBLtICN4tvFSikI+ljqpb3KAZDg2QU92xiE/TciGOyhD3bB4tFbepu+02NOgjUyMxnp
	71DwQzJs/kZWTaW3qLPIAkINYhodSx/U7iQMh/duZT3CaMYUccldjFmOjhCR89EqgL7/ndifBqL
	PE
X-Received: by 2002:a05:622a:5a1b:b0:4ec:f403:3019 with SMTP id d75a77b69052e-501481f9c07mr59667491cf.21.1768422828494;
        Wed, 14 Jan 2026 12:33:48 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89266b31acdsm49423716d6.37.2026.01.14.12.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 12:33:48 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/2] arm/trusted-firmware-a: add v2.14.0 support
Date: Wed, 14 Jan 2026 15:28:01 -0500
Message-Id: <176842248234.3731607.18314439642008677067.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260112190457.93847-1-jon.mason@arm.com>
References: <20260112190457.93847-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 14 Jan 2026 20:33:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6847


On Mon, 12 Jan 2026 14:04:56 -0500, Jon Mason wrote:
> Add support for v2.14.0, and update corstone1000 config and patches to
> use it.  TF-A seems to have changed their poetry settings from POETRY to
> host-poetry (when specifying an alternative location/disabling).  So, it
> is necessary to modify that for all platforms using COT and v2.14.0
> 
> NOTE: sbsa-ref is having issues with fip.bin being too large.  So, set
> the version to the LTS until that is resolved.
> 
> [...]

Applied, thanks!

[1/2] arm/trusted-firmware-a: add v2.14.0 support
      commit: a95040828cf077e83c48b8c2dc4b3698fc8227cd
[2/2] arm/edk2-firmware: update to edk2-stable202511
      commit: f6c78d277083b3a8498742530f86d392e33c8d09

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

