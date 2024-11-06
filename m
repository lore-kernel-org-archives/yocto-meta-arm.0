Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A92FD3E78C
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 05:52:03 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web10.39690.1730872320453745712
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 05 Nov 2024 21:52:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=tbg3NpNt;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.172, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-460af1a1154so41745731cf.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 05 Nov 2024 21:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1730872319; x=1731477119; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hvwfEYJ5xf1hvG4uz1cPg8MYvlggCS13kXLS5urhQ3g=;
        b=tbg3NpNt8u9Qpx1Vurm9EPcn/DPqLma7F1i3T3nruS513/H0IheSsTpobMnDQRf1dc
         Cs9eGZazzaF0A4OrvK+hlsEtRyB80g/tyTKzNI57lzF/eYgCMRDOFTw8BvitQChOthGc
         EQLofFiSd+9llPanvl8VdjqTZ2SB2VLmaVPv/W5zprHqAYCy0fvSW1HOl6WFXiBb7/Jo
         LOWlroGsh2UBq2loG2jaFtKuLVqYd1Inj4KsknMI//T9ziYj+8AbrezZMN2/rrwoAJ8r
         69syIPCrGOZXuttx1kqiSdtZ6lyloetRlJjyyhdBCd+D2spybxPM+po5o19Ijpm1OYPd
         NuUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730872319; x=1731477119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hvwfEYJ5xf1hvG4uz1cPg8MYvlggCS13kXLS5urhQ3g=;
        b=hhueX910HC46vXzvHJfsPOGL7W3APz2ZSAOgKl6Dl/6ZUR5CXO98RLalZBebdgTlmE
         PYDbIjNIr9T5fBAA4CqV52w+MLTI9plKV5OkzpfJq7esP2sEC+tIfD+JH1UBXl7wtIzt
         jXWA2VGiBPPsCyb1d+btDvjsSAKR4DXYdluTu/RkULpxNKt8IqngNvX/5mo4BuYS3GnQ
         wLy0EMBw3suOnkkO6S7t+/t0FCtD6/0FaAiLyumTe188nYZ3oMIw8AgUotXOApUaEa9U
         vOjQy5V1NC8sbLbJtRJVrO9JfPkwAps1VI+AtVCx++5nsaJOCAkPzjFtefvNirqbUW8H
         izCA==
X-Gm-Message-State: AOJu0YwFm2WaZwY6am9N0/N4/ayqXuvLNK4gW0rFDDKqJ668piZj4SNf
	ce1w4OPPEfIlScYJSVc4+6zDE2FYAV13ly7fV3AO+k6RridJrIe1ndHjroOgd3RmS6M5+uHPFvk
	=
X-Google-Smtp-Source: AGHT+IGBu+XFOWlWvvfH+uttnCDBP4j3CGuJqaW3WfBf3NKSnCHkvoqgqyP8UzEfH/WEGcaIWbTT7g==
X-Received: by 2002:ac8:590a:0:b0:461:123:d168 with SMTP id d75a77b69052e-462ab307d1emr313194171cf.50.1730872319149;
        Tue, 05 Nov 2024 21:51:59 -0800 (PST)
Received: from localhost ([136.56.18.214])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-462ad086d76sm67516331cf.9.2024.11.05.21.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 21:51:58 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ziad Elhanafy <ziad.elhanafy@arm.com>
Subject: Re: [PATCH] arm-systemready/linux-distros: Follow WORKDIR -> UNPACKDIR transition
Date: Wed,  6 Nov 2024 00:51:35 -0500
Message-Id: <173087229577.1888529.15716197365397398286.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241028171835.2387945-1-ziad.elhanafy@arm.com>
References: <20241028171835.2387945-1-ziad.elhanafy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 06 Nov 2024 05:52:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6243


On Mon, 28 Oct 2024 17:18:35 +0000, Ziad Elhanafy wrote:
> This adapts to the oe-core rework to enforce a separate directory
> for unpacking local sources (UNPACKDIR) instead of polluting WORKDIR
> directly.
> 
> Follows the guidelines from:
> https://lists.openembedded.org/g/openembedded-architecture/message/2007
> 
> [...]

Applied, thanks!

[1/1] arm-systemready/linux-distros: Follow WORKDIR -> UNPACKDIR transition
      commit: ac05154c5150af98be52ab225d6252ec4e78c217

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

