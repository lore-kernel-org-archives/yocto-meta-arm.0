Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 453EAC25B78
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 22:39:23 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web11.1126.1717540761195097795
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Jun 2024 15:39:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=DfmsVujX;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.171, mailfrom: jdmason@kudzu.us)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dfa7ab78ef2so4785371276.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 04 Jun 2024 15:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1717540760; x=1718145560; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1vZ3xH/fMpAJNhuGSopm598cX0WD0/n1UE4vDb6eeL0=;
        b=DfmsVujXRvDE/qc8OzE3fQdQ0SNP9EjKByaaaDXPWeE9J21nxhT6jTavVZ1X+R3eCn
         0LMjYmyQa19vHCW/Nod45XmRC46Cv96CBzXcOfHwnv7mfqCfKY05VzL7U35a4GEAc9mN
         A5xyD43Gln4AYo4a4aUOqmCUnqRBjOCRHwHjXyC4n/9vrXPzPMeuhVAITFwf5EINAtG4
         +1McQVnceUHDs6/XnpPNz335f0RVV7FP/DpBrYb5bjXmiHqjEFmf14L3mKyebxuLUsOn
         ydL0BTH1RRpY7MH5HiojH5ORrxfqeEnQZY2G0NKe/bQ9qFuZbHbNtw+snySH/ESAEp9x
         V3cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717540760; x=1718145560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1vZ3xH/fMpAJNhuGSopm598cX0WD0/n1UE4vDb6eeL0=;
        b=O8d4is852nr3kJGkEZVmJdJqGcjm7xhuWePT2RUWSoWy+yYOuMjFneN3lvHT+GFnIu
         x4xIh9HaqnZVReHJHMbnoB7NxkjOIYPtIXM7Pbhp4/avFSyR4+dzKjFwrfXGQ+qT4iDv
         e01wBCoBLb0AVRgQKnmSlT1fV7DVvNU/IvwkPkJAY/odCo1R6FiRYY5LZRGW63Vw0wb+
         VentaqJhEu3JX84ZV/k8YcD+nSd+xFkEH4i3KOrXaQMYfVETACK1RSfxyDZ51kX6rdet
         DCXpnG7jkZAuuqXX2a7QsSnPS8BvIo6Hd5B9GDTi3ZO2sPRz3E5MqJZ6ZRcPXV7Nktug
         HpnQ==
X-Gm-Message-State: AOJu0Yyrk96yrj/bK4H3tsgjNPpspCGVuuvF5ZDWSiRL61NsvscoaROD
	KNbsNln8to3KLjMxi+6aafT0FTVzRuPkYl0ndlLo6lKEv1IJvZdpDcZ+HDYswmXW5ifz0cxetEg
	=
X-Google-Smtp-Source: AGHT+IH/7ueMTWaeUPK4b7OONSxQKKFNyDAIzdY65hDyr0JgZh+OS6DBYqBg2l3NLLG/k2EV075aMQ==
X-Received: by 2002:a25:6886:0:b0:dcf:3ef5:4d30 with SMTP id 3f1490d57ef6-dfacac316damr753078276.17.1717540760000;
        Tue, 04 Jun 2024 15:39:20 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43ff23c5ef2sm53531511cf.24.2024.06.04.15.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 15:39:19 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	bence.balogh@arm.com
Subject: Re: [PATCH 0/1] Corstone1000: Make sure EULA is accepted manually
Date: Tue,  4 Jun 2024 18:39:14 -0400
Message-Id: <171754075530.2679408.10008309843784059503.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240604082522.193772-1-bence.balogh@arm.com>
References: <20240604082522.193772-1-bence.balogh@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 04 Jun 2024 22:39:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5792


On Tue, 04 Jun 2024 10:25:21 +0200, bence.balogh@arm.com wrote:
> From: Bence Balogh <bence.balogh@arm.com>
> 
> The LICENSE_FLAGS_ACCEPTED += "Arm-FVP-EULA" was added to a kas file,
> so the user did not have to accept it manually. This commit fixes this.
> 
> Bence Balogh (1):
>   kas: corstone1000: remove Arm-FVP-EULA flag
> 
> [...]

Applied, thanks!

[1/1] kas: corstone1000: remove Arm-FVP-EULA flag
      commit: 3922b495290931cde01047be0e2ef4bcc62bb33b

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

