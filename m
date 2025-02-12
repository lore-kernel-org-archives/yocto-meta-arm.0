Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05BAAC02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 13:51:27 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web10.16088.1739368276763170648
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 12 Feb 2025 05:51:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=TwOgLf1M;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.173, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-46fa764aac2so51597751cf.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 12 Feb 2025 05:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1739368275; x=1739973075; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31WYJpgILRk/vPaDDBtjXMTw5f7z88YfQayunZobXbk=;
        b=TwOgLf1Mu14SnOmtDr1ObKLkymAD13xRdw5yE230dntWbf+qFrMuVDA7geLCa/VBPP
         4G3aldPnb9QFLBm/VEyHZBRHav9aFi4oPZqHx08Sy8spfhSZyg5wsaN/Pxk2rRz1YqHV
         4gv8lqf40Se6OAcS2xASPdIiz0X/QUAP/E/tqY9PqVmyf5hJnZ9aEoOjZABywdKccCtF
         fcggmoy2oIOajeOvl7gx66Qh29lqkPyZM3Q3mX11UKVk0IG2f+H8btnRzfEf1dc4k3Bv
         FjTxrKXgGHTxBJbagy4+oPboK/gmY8zNlhWEPd5Eqoan4DY9I+gRkYI/4T867bGQDXpS
         SmIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739368275; x=1739973075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=31WYJpgILRk/vPaDDBtjXMTw5f7z88YfQayunZobXbk=;
        b=SGKMQj86g6c2wpl/ZNy2bw1LsHh4mlyaNI+pnDQ53evIFdGNfoDbxPlzcr5kw9tjgp
         0Kd/fboF9A25AegHou0Qw6TfknNwuKT5YXUi9IVgC0P9Fx0O6SFTYevEGAL3/IOLl+iD
         f1hV5aqWipboKcA8DeXQsX30GFCxcuIFNUhGSU7EK/kUKojCbsKTuXn3T16ZL4wGpf8i
         b5p1F4WObwrLn6Ed5/Bo3U0zlz0eaVUFn9kArCdetU0pwfait69W6I65A1QZGDgxPBYY
         JsCrsmz0IUyabo4io65qFO7D0X/1jV7iiZ0ZZmrW1daTdW6IMDue9lzuabayEY75tl7C
         Mb/Q==
X-Gm-Message-State: AOJu0YxhgNObvjgf3xPgUKxWRLYTyfXH6pMve8NCQ0oSnHxQ7cqSHu/F
	p6bttYcotHJWZ/JBRZkWlfHsOl3a+T0o16JPSDfb7+NZDBpjDXkEEdYaYSjWFpWnwumuJoVZKqc
	=
X-Gm-Gg: ASbGncuEVfJ8YpdShGI75DH/6J9bR/HvMN2DxOinsTjZ0Zp4ITTSEbUREwXt4O868uP
	nxEKlK0UFiK/ANrj67/ItwYVE2imCqqjclM9y8rQNjXb3TYCc0zFxKAg6TQzx1H/+fgj9IhQMmS
	kXdWpgZ8puVLcc6ErG2Wx2IGqonNvjVmNRe88pxueahyu1A44isCA3z2o6oFyBoe8fG9yg5jxeP
	60HTshMKyiNXq0lOi+JuaY8O4Zw3xmppu7oDDHeq1W2GCBcbkvZ+9HHMbMSBKLqrBHbNYL0fLA8
	xGFlh7g=
X-Google-Smtp-Source: AGHT+IG9q/h0aSrz5n36nZbZ/46tnw/2O74rf+oZsCQ2ZbRzhF+VGXfWqxEpGXqctPlqPnag3/SG3w==
X-Received: by 2002:a05:622a:110:b0:471:9f4c:60a2 with SMTP id d75a77b69052e-471afe3b914mr55285451cf.16.1739368275509;
        Wed, 12 Feb 2025 05:51:15 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-471bcf774ddsm782781cf.55.2025.02.12.05.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 05:51:15 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Philip.puk@arm.com
Cc: Philip Puk <philip.puk@arm.com>
Subject: Re: [PATCH 0/1] arm-bsp/u-boot: corstone1000: Reserve memory for RSS comm pointer access protocol
Date: Wed, 12 Feb 2025 08:50:28 -0500
Message-Id: <173936822860.3712262.5740642426402173549.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250204150527.326455-1-Philip.puk@arm.com>
References: <20250204150527.326455-1-Philip.puk@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 12 Feb 2025 13:51:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6370


On Tue, 04 Feb 2025 15:05:26 +0000, Philip.puk@arm.com wrote:
> From: Philip Puk <philip.puk@arm.com>
> 
> This memory was used by OpenAMP to establish communication between
> the Secure Enclave and Trusted Services. After transitioning from
> OpenAMP to RSE_COMMS, this shared memory is now configured for the
> pointer access protocol in RSE_COMMS.
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/u-boot: corstone1000: Reserve memory for RSS comm pointer access protocol
      commit: d65627585548985491a79f01de6f37e325efab96

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

