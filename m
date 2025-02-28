Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A90BC19776
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 04:02:36 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.8470.1740715350531185520
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 27 Feb 2025 20:02:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=zwUlyR3g;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.171, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c04df48a5bso181928185a.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 27 Feb 2025 20:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1740715349; x=1741320149; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wUo1LBjXHqfZGpHQFmgTU+Qjx94TNyR424YW8imdvHY=;
        b=zwUlyR3gaAuWRD4am99YKTtEZdjgjRQpBLZi8neWzFhMFBfhfk05x4ltlwt5k1x/kx
         qgTGS0V4e4Az1xHVVDTbJLEaVwhbomAoWrU5xk7xAKjjT0es/fw4OrE4IB/fDk9DWtOe
         vOlm3eqdL7XkW6V5K4YHly0lu4hIDSh/27t7HB9puzabrDFSmY8Wv3YGhPAKfMz58TXY
         LYbN5czOi4WIgR69P5C/dt8Db13Cg4StaKeXqH7fvxD/kzuri9QTJvs84OsrA66Ddqvm
         ex37fC9xWgXHgcRy4AYkkWD1yu7gn5t/91+lSEGgPvIQNzJPh7jqOToJjUylUi8IwaIj
         iqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740715349; x=1741320149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wUo1LBjXHqfZGpHQFmgTU+Qjx94TNyR424YW8imdvHY=;
        b=ikJHguzGi6ChcDHUS8kcOXVCjJp1nhE/eozG9XyDw+m5rfqllCYhxD1EFu8N7quBVY
         BUEwDu0n4ItvEV62KUBDumuqlJyaJz7Y7lLH8wmDXxtin97Ho2i9xmndp56lD8J+yKmX
         6ZSz2+l+wj/1aj5Tjk0gW06DEM8V0LGzskTWXXzAq2Au9+wX+LHg9tvLfDX42EsvnbFo
         YF17/0iqBMWj0DeJV2/udFeFFqMfW84Efm0dn9BvVhdFgaMaQN4UyExd4O97Dgm0z53Q
         TG9jJ5MqsrMfz+GKu8xeopdvKpOz78sMPJZfq2+oili4prkwsCfNDsuCqtQj8oLb3O89
         oViA==
X-Gm-Message-State: AOJu0YxnCozXhhpXVooEtGcVcudxJ857de6sB6nqh1P9NRvmNhmDgCjp
	jg2ydRHf2z45NWlze9UAEhzX3KxoVECoscFHvXy2FlgDgljxUCb98lBUS2nRrTQYwOYU75K061o
	=
X-Gm-Gg: ASbGncv/dCwe/RNSAHjm5L1EnJ2TAdYuttlkwd8PY6L5ZcWo9+W/7bc4A11g6kMYEWA
	uLnt7HOeblyG5wdnfylJHxj4upVcdpeeyUg+NLxPalr4XrnqBZTGHU/9/RlxJAipRK1G1VOqvfi
	lqFI0QmgpoEY8dviDHW+ul4jqc5+fwOndg076RHTt4ZYyCqwdtYLq7ztmZarEX+KZiJW2/NBG3f
	XdjXhaFSDAf3iAGYmmmD8lNrIBPFt07lufzyi/Mm3VeBnGOKf2cpkZkcdEtg4XdmlQXT4RlL0o9
	6oHc/HbWyTJuR3U3ig==
X-Google-Smtp-Source: AGHT+IEoty35Moome4P54lhREYY1cZCNBOSA5W1n4euIRcdgzno+/xKRByKcqGcvCyX0FNjffoxBwg==
X-Received: by 2002:a05:620a:44cd:b0:7c0:ad3e:84a7 with SMTP id af79cd13be357-7c39c4ccd18mr258469685a.26.1740715349401;
        Thu, 27 Feb 2025 20:02:29 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c378d9fec4sm193514685a.67.2025.02.27.20.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 20:02:28 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jose Quaresma <quaresma.jose@gmail.com>
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: Re: [PATCH][master][scarthgap] bsp: optee-client: cleanup old tee-supplicant
Date: Thu, 27 Feb 2025 23:02:17 -0500
Message-Id: <174071533788.3689039.14716533685253446991.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250221122301.2009380-3-jose.quaresma@foundries.io>
References: <20250221122301.2009380-3-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 28 Feb 2025 04:02:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6394


On Fri, 21 Feb 2025 12:23:03 +0000, Jose Quaresma wrote:
> The same tee-supplicant is available in the meta-arm layer
> along with the recipe.
> 
> | meta-arm/recipes-security/optee/optee-client
> | meta-arm/recipes-security/optee/optee-client/tee-supplicant.sh
> | meta-arm/recipes-security/optee/optee-client/tee-supplicant@.service
> | meta-arm/recipes-security/optee/optee-client.inc
> | meta-arm/recipes-security/optee/optee-client_4.1.0.bb
> 
> [...]

Applied, thanks!

[1/1] bsp: optee-client: cleanup old tee-supplicant
      commit: a55e4445f2614270da3f8fac38aa870c1409f919

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

