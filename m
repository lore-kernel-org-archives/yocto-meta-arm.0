Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 938B8E7717F
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 14:02:48 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.82059.1734444164811869089
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 06:02:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=kdbOzS5C;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.49, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6d888fc8300so25274276d6.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 17 Dec 2024 06:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1734444164; x=1735048964; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PwECSg8AvUZFBo6LowM9dZNOJkUxLlFkSWzyhmfJfFU=;
        b=kdbOzS5CdKSw5TNBF1qDZQ9gAFpfq478NH5GgNZ7o6WIVQDJHcQu9MntWi1ASP+j4m
         4YCjFB5oQgElu1m2AepSSEPMQ85c1xyK6E4qg/o4OYqi8b7Z/DvTy0D9w98FUQu8SZwi
         9CU0HKBmp+w9yUVnfMzFc186tVfseevFonh2SMftYlrDFLrZCzqZaAKDEwlazM7CwA5R
         i97bTbFfCR9/mZ+Z+DpEfmN1uCzdMI3IKwW+jY3sWosJkvQwhIOnhKE2/1uHAUPWOY1t
         R0UO/kVCojDnJe/L9kPOVaeBzIr7dsTsvIV6vHTgIYoWjP5E7pDeopCCtuMFrtJUJeS9
         umFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734444164; x=1735048964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PwECSg8AvUZFBo6LowM9dZNOJkUxLlFkSWzyhmfJfFU=;
        b=m+PsmD3cXf0SHyOGGkU6SFFGjPJwaSW3TgLNk+w4JpVf3VIayw1HgZzFApp73XVoq0
         GBnHtxMWidukAuqF/dOtNRWeKJQ+1YbT6wnx+N6hUw7KAuDGljqLCPz5ILkNyt+8vTIW
         aOBiGMhou5TMZFsUaeu6luLWL4BEqsFBTdHlYKiB/3/SWNkrtXZZFX334Et+XtzrdM3b
         MVTN/WPx29+S3RC9kzBkoFEgJwJ+ObCxk6vq5Qsb+zY7omJfPeHbTG2jJ7sstudzS5uw
         p9LVyWnLaWdR8eADhNdS9Ni0zZOWo8XBW9Qz7mgjUW6t7QayaVsvvoN463upK5sZWWtN
         NQuQ==
X-Gm-Message-State: AOJu0Yx7lheOZeoutBpRFR7QPpe8Lvu3HnDrQ79puBpXM+iPWE8b5Z5e
	KkXqIli0H79eygEqCtMvXScWUd+PfWcZU583KLySD8PlVDKypP1fLdlffcYa3KuJzZUasAWxY+k
	=
X-Gm-Gg: ASbGncup8rMfai4stWjlLrvkiFqKTaC+ip68E/GT6DD/oVEgR08XEWo5czEy0soFoX/
	5j+uiWwh6ayqLTSSmY/Xfrc4ecvzkb5HsmXgkO2GpK3rpAhCs3uNKu/iDYyrVm7X5sAsyHZygDL
	s5bygupEZg/Z1bbzp63dgjNdJ3btP1g0ipRnzNNPjr2UiSHJf4yxdHjLmzrXrWLh5PSmCGOFKME
	2PF6cQz7P5RF2NW+IyrsJ1OlTynG0VBD46d9AUnmn6OjiRL
X-Google-Smtp-Source: AGHT+IFfvRk2FODRexWCMptPt4MPs1D3KSzY421XoTpHviPQ4Fj74vYw0BzXdoI3fO2xspiobayHeQ==
X-Received: by 2002:a05:6214:2524:b0:6d4:254f:1c8e with SMTP id 6a1803df08f44-6dc903206f5mr231560556d6.37.1734444162976;
        Tue, 17 Dec 2024 06:02:42 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dccd387c92sm38774006d6.120.2024.12.17.06.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 06:02:42 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/2] arm-bsp/linux-yocto: fix Juno build with linux 6.12
Date: Tue, 17 Dec 2024 09:02:23 -0500
Message-Id: <173444414287.2113109.875232791366385643.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241213155608.726466-1-ross.burton@arm.com>
References: <20241213155608.726466-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 Dec 2024 14:02:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6295


On Fri, 13 Dec 2024 15:56:07 +0000, Ross Burton wrote:
> The DesignWare platform driver is hidden behind a DesignWare Core option
> now, so enable that too.
> 
> 

Applied, thanks!

[1/2] arm-bsp/linux-yocto: fix Juno build with linux 6.12
      commit: fd2ba2d29094aea8fd839352d4906be23f708bc6
[2/2] arm-bsp/linux-yocto: add temporary 6.10 recipe
      commit: 83d9575a381b650b90965c6eda585a434255d975

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

