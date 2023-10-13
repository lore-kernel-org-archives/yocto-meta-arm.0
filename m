Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36946CDB483
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 16:05:21 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web10.42783.1697213111192817402
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 Oct 2023 09:05:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=dX1gVMS3;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.48, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-65b07651b97so12779056d6.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 13 Oct 2023 09:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1697213110; x=1697817910; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4kHFLE9O8IEcJsGBBCONU0bxijtc/JtauxUrXukph4g=;
        b=dX1gVMS3bJMjkw6/GmMZoQy35JBnKT92u7f7DaMSQCfbk2LW12yeoVXKTEww1C3vE5
         ORDHbaMJvGIsuFhQwKVbUQK+6u7vZ4D5GjB3bx7lPEh5sRbGbs/I+knUOqKh6Nd4SswF
         GpnhtEU+TsbxLSNXScoqsqVXdYIiOblpZexjjZm5caP0GERaHe0++V1xy116gEo7LoRa
         OpxJCWAIuqL7NQ3HsZRe7Iosorgf3kA96cbUn6iovO/57oQThKtoQEuhvcJS4NIono4l
         WkEBv8B2ykixWAMO0JyYa8qNKqM5CrPUzT4usC8hk+gWjuko8wVy5KzZmY2jcNhM7rwh
         FM9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697213110; x=1697817910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4kHFLE9O8IEcJsGBBCONU0bxijtc/JtauxUrXukph4g=;
        b=SnJ9rOm5UxLm1LZpE0pTGNk7diZZHSBXgYvXBne9u4F5iQqn/IiRso4f2za8ZLMBL9
         PMkMtTVFabg3ud8AI0inHfKbqRoNauWkCQA1Bvm3SUo/zBWPGaZlcX3PQ5tOdQ5Qd6xS
         efD7+rHJJG/zVNOZV6dRkcSTq9ybjmn8yx+wqgu71yJ42plZ+Y9n0SSZ7Jt4ri+KkzRO
         FMRchWi05FZutTHgOqDvBdsR6ofh1iGQgPT+369T35VQJSWNWp3Z7Nw56NoPMlFL21Rz
         mynYgUGKFfIzVs+Ys6a0r5DffHEM+AGA8qYzs8sDDtDa5L11U5FRF+HwEWfJB8/ROpdu
         nJyg==
X-Gm-Message-State: AOJu0YyBbkJeGXvKhVYjIvyHEtWH5+tpmg+sep9fBWEik+WA8GnzkyJO
	CibR9j2FOElFdX82BmNwl6x/3/Wvno4bwhfhfro=
X-Google-Smtp-Source: AGHT+IHAALlI6/xT7/hF3WTm1PZJ1h119iFLTrVoSETdLgqAZrSwgJoqTflgSMdSbCWXlGzeN4CDig==
X-Received: by 2002:a0c:ef4f:0:b0:658:8f94:5e61 with SMTP id t15-20020a0cef4f000000b006588f945e61mr26703790qvs.43.1697213109740;
        Fri, 13 Oct 2023 09:05:09 -0700 (PDT)
Received: from localhost ([2605:a601:a684:4100:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id c27-20020a05620a165b00b007756736aee0sm731908qko.115.2023.10.13.09.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 09:05:09 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/2] arm-bsp/linux-yocto: add recipe for v6.4 kernel
Date: Fri, 13 Oct 2023 12:03:16 -0400
Message-Id: <169721299737.1302487.5683672751436824687.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231009005058.3858695-1-jon.mason@arm.com>
References: <20231009005058.3858695-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 13 Oct 2023 16:05:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5119


On Sun, 08 Oct 2023 19:50:57 -0500, Jon Mason wrote:
> The v6.4 kernel is needed for some platforms in meta-arm-bsp.
> Temporarily add it here to give those machines enough time to
> update to the latest version.
> 
> 

Applied, thanks!

[1/2] arm-bsp/linux-yocto: add recipe for v6.4 kernel
      commit: 07dbfed721a571d45a07c55ad7464d4b5fd26465
[2/2] arm/linux-yocto: remove defconfig patch
      commit: 86e17cf0737c62e8a610d060a430d5d808a7b832

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

