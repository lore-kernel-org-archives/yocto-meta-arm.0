Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE890F33A65
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 13:56:13 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44482.1772718971302283474
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 05:56:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=ekXU0fKA;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.175, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8cb7edbcde6so985530985a.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 05 Mar 2026 05:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1772718970; x=1773323770; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mjRiifz2Hoj68hgv4HPlfyB/7KAnyJi18zXWqlvLIj4=;
        b=ekXU0fKAUc69p7BCkvRyTxkS2I9zCCaCaPkoP5uIQqVqcOZdQT/FX6043Gh+10tUV/
         ykNUA3ZVA9o0BYAeZmds27kRkBaA0u3OXiewrRCEGSDY1fNO6dZ2cLnjweI0VwSIyGTZ
         NlE1G+/ydJph26vV3xN+LfXb5yvPPW6x/5PBQLSjhQoWAzoKZxtEwS145rKImi4HkZOg
         WSJMvuyD9w/snZ7ByXvtqHjvZYEFMojszz3ifdzBOnNzQwwEIkkupzrYtmuOsixo1k3Y
         H1n6N8DuBD9bmvHIbdwEtjKN7pQaPUG7azVK9E8GWOHyKrLq619cyvqZlUX276uijPVq
         FShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772718970; x=1773323770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mjRiifz2Hoj68hgv4HPlfyB/7KAnyJi18zXWqlvLIj4=;
        b=GCRhYE1PlRiLoIjGynClaOe5D4FWHgVe/kR9AWQ9sRECIQxxYFdJD51JYMv2iKKi85
         82CeXprJqIyw1/BS0pNBuBD6DLCMTGFKgXT1UPeedbS2/pqW0hxazR2NLinTMkaorWmm
         KwBfnm//6g86D0drWQcOoEopyZGnzxBfWWeP9k6eMR82GMCwdJmh8IqZ0NjPmgOlExy2
         JFkjSvovrBXzHUPnoI27QXTPca7RDCQhccAOVLRzxPYeKm04RKUEgCICEBUZ6EsBemka
         fFW4eTRxVfSOctdlb/c0EpZdTxLRRB6Po1kBjym2LiR+WSF1hy05dDCPotE+8K6iwfRC
         yTDQ==
X-Gm-Message-State: AOJu0Yx0mBQcQGaukFkeomrec6ugeIZeDnF0VqiwItkRXpFy+jaGxtLO
	HaGtFBhHh0pMZZKCMfyNeYQX3Q4mkvZmfSRIlImVrbE+BBoAuK39OX0bgWorsZtwhJFiQJO1V1l
	oV5A=
X-Gm-Gg: ATEYQzwvf8BxobxgEAddyj/r8WCvxGj2DO9cQC3LBjaVlSdy0NV00BrTnyDVaJMGPES
	LNKYu2F7w3Qs87fDIf0qdXq33BbCS1qLvBO/3HamhVd6v1gG9a8AGArjEXhICOCXOeBR1THKta6
	suNVBUr4DHOd/8lvFKDRcpXkyUmQrBciDWWaHEm9wQTpIcXUUycRMOaFMo9WTBiIa2F0kwRn9hW
	VGVh+yvr1Flmeu4TwQL3/U5FvcJr0PRjXWNz5YdD3LKCyN8PveOAkTwuYFvx0+iLlOVRL2otslu
	zvg1hd/PWpCSxeZztoI6tUmeRqpXo+1PwEz8EB8zgSVM8UufeNI84qMALJUKfSnIFsnk3E+FNsF
	en/JemqPW57d6n9pH5EaBhQ+xhHOhiK+NWmnvt8OedVYJGfZlKsyO955zVFEUdGNj+S4RZOQvdX
	LhiBg0vzZopMHxES+RLvDpH+A=
X-Received: by 2002:a05:620a:4546:b0:8cb:4c23:3de2 with SMTP id af79cd13be357-8cd5afc2cd9mr700792385a.76.1772718970006;
        Thu, 05 Mar 2026 05:56:10 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50744ab3d7csm174543371cf.20.2026.03.05.05.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 05:56:09 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: [PATCH] optee-client: Make include reusable outside of meta-arm
Date: Thu,  5 Mar 2026 08:55:52 -0500
Message-Id: <177271895367.2989959.12733077574795190928.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <a6ff3448-9e34-46f7-be2b-8d25d6fa3dbf@siemens.com>
References: <a6ff3448-9e34-46f7-be2b-8d25d6fa3dbf@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 05 Mar 2026 13:56:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6942


On Mon, 02 Mar 2026 19:08:10 +0100, Jan Kiszka wrote:
> Set FILESEXTRAPATHS so that artifacts that meta-arm injects can still be
> found when using the include from a different layer.
> 
> 

Applied, thanks!

[1/1] optee-client: Make include reusable outside of meta-arm
      commit: 1eec18f88c9d6ff47641cb29a512fed1f513ddbc

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

