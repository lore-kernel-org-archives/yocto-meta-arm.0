Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A0C0E7719C
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 22:23:02 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web11.3855.1736547775019377276
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 10 Jan 2025 14:22:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=kX7hAOpx;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.170, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4679fc9b5f1so19005911cf.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 10 Jan 2025 14:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1736547774; x=1737152574; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i6OzpDVBE/oTziLOEY90bENxIQahEu1eY3v7o/A/Q5U=;
        b=kX7hAOpx73843+RL9CHxT0SpQogi419p0ZOQChWTR8enQPJiGIM/aapKwuqYm2APqs
         ilKXQdVMzIE1NsI9zJBis8cXWtASvGaglAdDAzIfT0/DzOJRbnqpvrvKVInWtXV6f1Nw
         Je7RP1CeuPOtOnxiL+irHE9MGeb8cHARFzRdr5iNE5E5GLJUlcTcZbeOBve6F/VUaIKx
         N7Kr6XshGZV+FZgrReFjoh+cCcvaK95cPl+pYX07U0K1D6i5mvB42CKhoXxVqYxpqcAd
         GwQ+C8g3MdTGxAXVqdV76Y2IcbY/6Vsi5nAHP2U8cohAqzLoUakJC+iJkMp/VuIDEoYW
         FTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736547774; x=1737152574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i6OzpDVBE/oTziLOEY90bENxIQahEu1eY3v7o/A/Q5U=;
        b=mDIUMNLJh7dCeKaaM2gBQOfhyo5OX4xh640HCCsaBij+q8a9NHBlvFNZN0vQBYKKrF
         cXXIP30P8rb7xD3/Kcej67KJIp+o1j3QtOfiMtVJzbBmfXZvHq1EIinKiDOFmcaj3gtI
         i63yUXOCMcAUs5GFODsw4pBfaj4LAEgMlpFjUamGeUfFCorBh7OY6Wyt8lIQ0Roh5oT4
         5L7rjIaqSX2pags3hrMUDr96AKP7BtibhR1NLiy+tkTL9Wd8K7KqpZNEq7AqaMwIjmwi
         G9CsP8/DOEgkCW8eO1++l11Pas00sjT2dYu5XwnRnBRNQmC5ud6O6QTWK27ihjc0Yaet
         OWLg==
X-Gm-Message-State: AOJu0YxOgiXxtxOjJzMIMYoLn9dOw6KMTtQByAjaSsRBREmrvGLe1RLW
	ZuZF+qmkdMYqy/bpOGmR+UESNKH4WWrTUC77tikAVD3X/fup3JRJEyFQ2SURU32IPclLVEw7t30
	=
X-Gm-Gg: ASbGncvxFPWqmC5m5DPHactVH6AQiyWR4ZkLkssPAWf01Hfn7aPenOmNOot3CjdnI2w
	DA8V/XvWPcqL9mkxEQG9R3MG5Be1sphkx3yxxRGVyLN91wm04nT5WBUZeG7j9nYaA3lmxIA5lYj
	8YfMIlC2GwRHpfJC5EyD13F38rE7PHqlSIGQlu2eocx0i2+/vZbgNj78K9d/ew1siGpCc2joSKA
	3jtMFa+76XVrNp7MhXCubv1X4Y3AkkL3Im8EXsQi1NgClXk
X-Google-Smtp-Source: AGHT+IHrKjkjW4t3aAR8JZF7IjmYjlLndUypvDDn4+PP8bUimfuHEb4ZnGveniooxuR7m/lybv6Zrg==
X-Received: by 2002:ac8:5d53:0:b0:467:737f:d5ac with SMTP id d75a77b69052e-46c710aa93bmr180588811cf.25.1736547773680;
        Fri, 10 Jan 2025 14:22:53 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46c87324982sm13874251cf.6.2025.01.10.14.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 14:22:53 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/3] arm/trusted-firmware-a: update 2.10 LTS to the latest versions
Date: Fri, 10 Jan 2025 17:22:16 -0500
Message-Id: <173654773644.57277.9936183791083300428.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250110152635.99735-1-jon.mason@arm.com>
References: <20250110152635.99735-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 10 Jan 2025 22:23:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6317


On Fri, 10 Jan 2025 10:26:33 -0500, Jon Mason wrote:
> Update TF-A LTS to 2.10.9 (which includes an mbedtls bump to 3.6.1, per
> docs).  Also, bump the TF-A tests to the latest version.
> 
> 

Applied, thanks!

[1/3] arm/trusted-firmware-a: update 2.10 LTS to the latest versions
      commit: 772947ef0149220c6408012043b673f36ba9d6d9
[2/3] arm/trusted-firmware-a: add support for 2.12.0
      commit: 104f03c34730e0750d37a75e4c139a31ac9030e9
[3/3] arm/trusted-firmware-a: bump fip and tests to 2.12
      commit: 3032ed613d3c02f98b074be1dae0619be2be20a3

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

