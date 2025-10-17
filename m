Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC4D9CCD199
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 13:03:50 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.14875.1760706227786274565
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 17 Oct 2025 06:03:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=YA209j+n;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8906eb94264so180250585a.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 17 Oct 2025 06:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1760706227; x=1761311027; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I9a+2DKaCY151MI2P7QqIVaWAIJI2pSQ2aawqreDJMM=;
        b=YA209j+nCZhFMfOReSLuWGLXW2YaEKlTykcObBJkanOcpDVoUMxLaDuzrAkZORZqsx
         F6e9GSlRHU9hjoOoRc49i3cNKSIAmFYG7PgjNacnAP1SZh94ItjVNBJYA2wKNFhzkGlT
         yJz7UZZy31MM5cXui9KqFT9IvdmNsMvG8l0OxVAndQW/hMiM0xfZoVgCztISDEnHE4r6
         bQ+IxwiT5HPKDUULD7z3ZzZ4vU2IaZyEOwYbPXPxkBgv2aAVDJ6tP2OooYcR4WwF2gBq
         UfsCtfgKox9hX+VaJZ/s4NecGg9dxQWqZ3f6mOLONSR7SbqxU7bLfB8BT8b3tjX5ttIm
         Ni9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760706227; x=1761311027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I9a+2DKaCY151MI2P7QqIVaWAIJI2pSQ2aawqreDJMM=;
        b=TorKzJfATc/zt5GS28FAMMmiA0Hh5d2EEEhXL943erlf0dqCKDNK1wSSRp+0RoSV6Q
         QL7IGe2mnO3iBB3lU+wlO3jnFt2j4mlvlCl8+EOU6S8G5thevG15SDP6xLqMQ8Lph14v
         4M1USTSfLSA7jfp+0YE79ZYr2hGtGiPi4WYrMPlLVA5grZxCfdcN2c80XmWmLrjCdz+f
         97Aewemn0s5HcOnZXxqhNe9IzmLEv3RX//hLZ7WNlZxrcKoG2OBe7pHfMoFGrBGq7gml
         45rgznmpZ1Eg2b3LVIWnA+eOltEW2xfFWazcO2srUb6fBun9L7q4+DMnMq5sz4G+3p8/
         foeQ==
X-Gm-Message-State: AOJu0YwJVdP/DZZzC3jxYdqz4wPjjHfUhYAvRzIrqL3rNoujx9Kqngsw
	tIL7YsL8ucg/jxHqVE/yHrgC8KdMUr2VdfWT1YgrrY2k7YwRAD+y7OWdJKF4EXQtECFEyPJbHv1
	o9fQ=
X-Gm-Gg: ASbGnctOk6MbLdg4g7TN73ivItobHb+JnCHJ05YUSgtPSDkTqJ5SWVNp3t8T/sJN2Y3
	KKu76UhxqS60KM0KafEIaOu4m9G0Fs7gYljP62+DLVOBCLkCaEWfZepFfUuENT7a6CMl9RqVxMx
	XuB/GnQ0KSiiMf4OqhLDYu6nNZrFyuf8o3is0Bzukx4fkCEu6LbQYv1Kj8qoCPDSzdn9zoDhdZc
	T8uo/f9iIhXB9cbkrf22y53ENqLjorKue88gC5zUG12j862MdEPMD2ZiJNaSBxm9pd+7jcnzaNv
	S34ZzSaZmCWXjCZ1MTaT9sgQwFirXig5ygPdvsgpqu1bwDyy5i8U9zEwLJLgvTwx20Ot29AoV0y
	Vxsm8hZ3YQSbMJJADoXbq4yK3epUP6u61NPzcujaaHWPQ6O2xv/MzouBPsJG5nsmo+/+bLLfQlX
	9Eaw==
X-Google-Smtp-Source: AGHT+IG+9969wlzvkZ2woeEs4YAXMydQXnhpmo+lRqHNXqrAlMvBHlxgD9xInyG6PcLJo6KJbwa1yA==
X-Received: by 2002:a05:622a:188f:b0:4d8:f0e4:f92e with SMTP id d75a77b69052e-4e89d210536mr46151271cf.18.1760706226440;
        Fri, 17 Oct 2025 06:03:46 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e89aedad52sm25731891cf.30.2025.10.17.06.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 06:03:45 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] arm/oeqa/fvp: update for new ignore_ssh_fails argument to run()
Date: Fri, 17 Oct 2025 09:03:31 -0400
Message-Id: <176070621153.1945921.13308370438828994508.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251012104900.2505243-1-ross.burton@arm.com>
References: <20251012104900.2505243-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 17 Oct 2025 13:03:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6738


On Sun, 12 Oct 2025 11:49:00 +0100, Ross Burton wrote:
> The OESSHTarget object now has a ignore_ssh_fails keyword argument[1],
> so update this subclass to match.
> 
> As the implementation of run() here simply forwards the arguments, we
> can use *args, **kwargs so that future changes don't cause problems.
> 
> [1] oe-core afe118d4f2d ("oeqa: target: ssh: Fail on SSH error even when errors are ignored")
> 
> [...]

Applied, thanks!

[1/1] arm/oeqa/fvp: update for new ignore_ssh_fails argument to run()
      commit: 595e4a439a93fc16e22236dba577575b18272675

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

