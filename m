Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E06FC4332F
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 16:58:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1803.1669222698869664708
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Nov 2022 08:58:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63E9E1FB;
	Wed, 23 Nov 2022 08:58:24 -0800 (PST)
Received: from [10.1.199.64] (unknown [10.1.199.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B98F3F73B;
	Wed, 23 Nov 2022 08:58:17 -0800 (PST)
Message-ID: <9b95e5d7-adaa-5ef9-f6c1-f4a4fdfbb732@arm.com>
Date: Wed, 23 Nov 2022 16:58:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-arm] [PATCH 1/2] arm/classes: Introduce
 apply_local_src_patches bbclass
To: meta-arm@lists.yoctoproject.org
Cc: Diego.Sueiro@arm.com
References: <17299F9E2566618E.25787@lists.yoctoproject.org>
Content-Language: en-US
From: Peter Hoyes <Peter.Hoyes@arm.com>
In-Reply-To: <17299F9E2566618E.25787@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 23 Nov 2022 16:58:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4165

Please can this patch chain be backported to langdale.

On 21/11/2022 14:23, Peter Hoyes via lists.yoctoproject.org wrote:
> From: Diego Sueiro <diego.sueiro@arm.com>
>
> This class is to be inherited by recipes where there are patches located inside
> the fetched source code which need to be applied.
>
> The following variables need to be set:
> LOCAL_SRC_PATCHES_INPUT_DIR is the directory from where the patches are located
> LOCAL_SRC_PATCHES_DEST_DIR is the directory where the patches will be applied
>
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
> Change-Id: I8f9c16a5fbc9d5569cba60136560f1951408bd60
> ---
>   .../classes/apply_local_src_patches.bbclass   | 48 +++++++++++++++++++
>   1 file changed, 48 insertions(+)
>   create mode 100644 meta-arm/classes/apply_local_src_patches.bbclass
>
> diff --git a/meta-arm/classes/apply_local_src_patches.bbclass b/meta-arm/classes/apply_local_src_patches.bbclass
> new file mode 100644
> index 00000000..daa85f4c
> --- /dev/null
> +++ b/meta-arm/classes/apply_local_src_patches.bbclass
> @@ -0,0 +1,48 @@
> +# This class is to be inherited by recipes where there are patches located inside
> +# the fetched source code which need to be applied.
> +
> +# The following variables need to be set:
> +# LOCAL_SRC_PATCHES_INPUT_DIR is the directory from where the patches are located
> +# LOCAL_SRC_PATCHES_DEST_DIR is the directory where the patches will be applied
> +
> +do_patch[depends] += "quilt-native:do_populate_sysroot"
> +
> +LOCAL_SRC_PATCHES_INPUT_DIR ??= ""
> +LOCAL_SRC_PATCHES_DEST_DIR ??= "${LOCAL_SRC_PATCHES_INPUT_DIR}"
> +
> +python() {
> +    if not d.getVar('LOCAL_SRC_PATCHES_INPUT_DIR'):
> +        bb.warn("LOCAL_SRC_PATCHES_INPUT_DIR variable needs to be set.")
> +}
> +
> +apply_local_src_patches() {
> +
> +    input_dir="${LOCAL_SRC_PATCHES_INPUT_DIR}"
> +    dest_dir="${LOCAL_SRC_PATCHES_DEST_DIR}"
> +
> +    if [ ! -d "$input_dir" ] ; then
> +        bbfatal "LOCAL_SRC_PATCHES_INPUT_DIR=$input_dir not found."
> +    fi
> +
> +    if [ ! -d "$dest_dir" ] ; then
> +        bbfatal "LOCAL_SRC_PATCHES_DEST_DIR=$dest_dir not found."
> +    fi
> +
> +    cd $dest_dir
> +    export QUILT_PATCHES=./patches-extra
> +    mkdir -p patches-extra
> +
> +    for patch in $(find $input_dir -type f -name *.patch -or -name *.diff)
> +    do
> +        patch_basename=`basename $patch`
> +        if ! quilt applied $patch_basename >/dev/null ; then
> +            bbdebug 1 "Applying $patch_basename in $dest_dir."
> +            echo $patch_basename >> patches-extra/series
> +            cp $patch patches-extra
> +            quilt push $patch_basename
> +        else
> +            bbdebug 1 "$patch_basename already applied."
> +        fi
> +    done
> +}
> +do_patch[postfuncs] += "apply_local_src_patches"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#4140): https://lists.yoctoproject.org/g/meta-arm/message/4140
> Mute This Topic: https://lists.yoctoproject.org/mt/95172542/5715260
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [peter.hoyes@arm.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

